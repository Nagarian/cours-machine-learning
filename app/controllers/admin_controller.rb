class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
  end

  def github
    exec('git pull')
  end
end
