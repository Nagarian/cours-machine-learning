class WelcomeController < ApplicationController
  def index
    @championnats = Championnat.all
    @championnat = Championnat.find_by(name: (params[:id] || "Ligue 1"))
    @matches = Match.where(championnat: @championnat).order(:matchday).paginate(:page => params[:page], :per_page => 3)
  end
end
