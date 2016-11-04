class WelcomeController < ApplicationController
  def index
    @championnats = Championnat.all
    
    @championnat = Championnat.find((params[:id] || 1))

    @matches = Match.where(championnat: @championnat).where(championnat_year: "2016_2017").order(matchday: :desc).paginate(:page => params[:page], :per_page => 10)

    if @matches.all? { |match|  match.home_prevision != nil && match.home_score != nil }
      @good_prediction = @matches.count { |match| (match.draw_prevision > match.home_prevision && match.draw_prevision > match.away_prevision && match.home_score == match.away_score) || (match.home_prevision > match.away_prevision && match.home_score > match.away_score) || (match.home_prevision < match.away_prevision && match.home_score < match.away_score) }
    end
  end
end
