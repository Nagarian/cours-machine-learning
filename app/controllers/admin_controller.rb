class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
  end
end
