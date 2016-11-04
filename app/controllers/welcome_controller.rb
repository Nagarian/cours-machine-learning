class WelcomeController < ApplicationController
  def index
    PredictionJob.perform_async()
    @championnats = Championnat.all
    
    @championnat = Championnat.find((params[:id] || 1))

    @matches = Match.where(championnat: @championnat).where(championnat_year: "2016-2017").order(:matchday).paginate(:page => params[:page], :per_page => 10)
  end
end
