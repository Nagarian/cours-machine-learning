class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
  end

  def github
    system('git pull')
    render 'admin'
  end
end
