class ProfileController < ApplicationController
  before_filter :authenticate_user!
  def index
    @user = User.find(current_user.id)
  end

  def edit
    user = User.find(current_user.id)
    if params[:user] and params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    user.attributes = params[:user] if params[:user]
    user.save!
    redirect_to :action => 'index'
  end

end
