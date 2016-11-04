class WelcomeController < ApplicationController
  def index
    @championnats = Championnat.all
    
    @championnat = Championnat.find((params[:id] || 1))

    @matches = Match.where(championnat: @championnat).where(championnat_year: "2016_2017").order(matchday: :desc).paginate(:page => params[:page], :per_page => 10)
  end
end
