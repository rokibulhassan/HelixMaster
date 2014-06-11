class RlcodesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    @rlcodes = Rlcode.paginate(:page => params[:page], :per_page => 10)
  end
end
