class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index; redirect_to :action => 'new' ; end
  def edit; new_or_edit;  end

  def new
    respond_to do |format|
      format.html { new_or_edit }
    end
  end

  def destroy
    @record = User.find(params[:id])
    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def new_or_edit
    @users = User.paginate(:page => params[:page], :per_page => 10)
    @user = case params[:id]
                  when nil
                    User.new
                  else
                    User.find(params[:id])
            end
    if params[:user] and params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user.attributes = params[:user] if params[:user]
    if request.post?
      respond_to do |format|
        format.html { save_user
        @users = User.all}
        format.js { @user.rlcode = params[:rlcode]
        save_user
        @users = User.all}
      end
      return
    end
    render 'new'
  end

  protected

  def save_user
    if @user.save!
      flash[:notice] = 'User was successfully saved.'
    else
      flash[:error] = 'User could not be saved.'
    end
    redirect_to :action => 'new'
  end
end
