class ExtranetUsersController < ApplicationController

  def index
    @extranet_users = ExtranetUser.paginate(:page => params[:page], :per_page => 10)
  end

  def upload_users
    begin
      ExtranetUser.import(params[:file])
      flash[:notice] = 'Successfuly uploaded extranet users.'
    rescue Exception => e
      flash[:error] = 'An error prohibited extranet users uploading.'
    end
    redirect_to :action => 'index'
  end

  def edit
    @extranet_user = ExtranetUser.find(params[:id])
    if @extranet_user
      @extranet_user.rl_code = params[:rlcode]
      if @extranet_user.save!
        @message = 'User was successfully saved.'
      else
        @messsage = 'User could not be saved.'
      end
    end
    respond_to :js
  end
end
