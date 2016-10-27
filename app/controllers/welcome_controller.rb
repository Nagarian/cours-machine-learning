class WelcomeController < ApplicationController
  def index
    @championnat = Championnat.find_by(name: "Ligue 1")
    @matches = Match.where(championnat: @championnat).paginate(:page => params[:page], :per_page => 3)
  end
end
