class ResultsController < ApplicationController
  def index
    render :layout =>'accounts'
  end
  def get_results
    if params[:extranet_user].nil?
      redirect_to :controller => 'results', :action => 'index'
      return
    end
    extranet_user = ExtranetUser.where(:viewable_code => params[:extranet_user][:viewable_code]).first
    if extranet_user
      viewable_code = extranet_user.viewable_code
      password = params[:extranet_user][:password]
      if password == extranet_user.password
        @code = Rlcode.where(:code => extranet_user.rl_code).first
        render 'index', :layout => 'accounts'
        return
      end
    end
    flash[:error] = 'Invalid code or password'
    render 'index', :layout => 'accounts'
  end
end
