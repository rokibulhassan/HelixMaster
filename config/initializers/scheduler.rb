scheduler = Rufus::Scheduler.new

scheduler.every("1m") do
  fetch_emails
end

def fetch_emails
  rlcode = Rlcode.order('created_at').last
  imap = Net::IMAP.new(Settings.imap_server, :ssl => (Settings.imap_ssl ? Settings.imap_ssl == 1 : false))
  imap.login(Settings.imap_email, Settings.imap_password)
  imap.examine('INBOX')
  date = DateTime.parse(rlcode.created_at.to_s) unless rlcode.nil?
  since = "#{rlcode.nil? ? '1-Jan-2014' : "#{date.strftime('%d-%b-%Y')}"}"
  msgs = imap.search(['SINCE', since])
  msgs.each do |msgID|
    _body = imap.fetch(msgID, "RFC822")[0].attr["RFC822"]

    require 'mail'
    mail = Mail.new(_body)

    attachment = mail.attachments.first
    unless attachment.nil?
      fn = attachment.filename
      if fn.include? '.pdf'
        begin
          File.open('tmp/'+fn, "w+b", 0644) { |f| f.write attachment.decoded }
          path = File.join Rails.root, 'tmp/', fn
          reader = PDF::Reader.new(path)
          page = reader.pages.first
          code = page.raw_content.split('(Case: ').last.split(')').first
          summary = page.raw_content.split('(Probability of Paternity:)').last.split(')').first.split('(').last
          if code and summary
            rlcode = Rlcode.new
            rlcode.code = code
            rlcode.summary = summary
            file_path = File.join Rails.root, '/public', '/resource/'
            FileUtils.mkdir_p(file_path) unless File.exists?(file_path)
            rlcode.file_path = '/resource/' + fn
            File.open((File.join Rails.root, '/public')+rlcode.file_path, "w+b") { |f| f.write File.read(path) }
            File.delete path
            rlcode.save!
          end
        rescue Exception => e
          puts "Error : Unable to save data for #{fn} because #{e.message}"
        end
      end
    end

  end
  imap.logout
end