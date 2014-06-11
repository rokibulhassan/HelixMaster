class SettingsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :class => 'Settings'

  def index
    @imap_ok = false
    begin
      require 'net/imap'
      imap = Net::IMAP.new(Settings.imap_server, :ssl => (Settings.imap_ssl ? Settings.imap_ssl == 1 : false))
      imap.login(Settings.imap_email, Settings.imap_password)
      @imap_ok = true
      imap.logout
    rescue Exception => e
      puts "Error : IMAP Settings error : #{e.message}"
    end
  end

  def update_settings
    !params[:imap_server] ? (Settings.destroy :imap_server if Settings.imap_server) : Settings.imap_server = params[:imap_server].to_s
    !params[:imap_email] ? (Settings.destroy :imap_email if Settings.imap_email) : Settings.imap_email = params[:imap_email].to_s
    !params[:imap_password] ? (Settings.destroy :imap_password if Settings.imap_password) : Settings.imap_password = params[:imap_password].to_s
    !params[:imap_ssl] ? Settings.imap_ssl = 0 : Settings.imap_ssl = 1
    redirect_to :action => 'index'
  end
end
