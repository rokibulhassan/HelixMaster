# encoding: utf-8
class WelcomeController < ApplicationController
  def index
    if current_user
      if current_user.role == 'admin'
        redirect_to :controller => 'rlcodes', :action => 'index'
      else
        redirect_to :controller => 'results', :action => 'index'
      end
    end
  end

  def search_store

  end
  
end
