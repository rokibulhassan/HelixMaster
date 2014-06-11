class ExtranetUser < ActiveRecord::Base
  attr_accessible :password, :rl_code, :viewable_code

  def self.import(file)
    CSV.foreach(file.path, headers: false) do |row|
      next if row.empty?
      item = row.first
      viewable_code = item.split(' ').first
      password = item.split(' ').last
      ExtranetUser.create!(viewable_code: viewable_code, password: password)
    end
  end
end
