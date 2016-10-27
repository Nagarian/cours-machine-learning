class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
  end

  def github
    system('git pull')
    redirect_to admin_path
  end
end
