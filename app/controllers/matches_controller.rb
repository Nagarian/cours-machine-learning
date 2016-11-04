class MatchesController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all.where(championnat_id: 1).where(championnat_year: "2016_2017").order(matchday: :desc).paginate(:page => params[:page], :per_page => 10)
  end
  
  def show
    @match = Match.find(params[:id])
    @data = [
      [ @match.home_team, @match.home_prevision],
      [ "Match nul", @match.draw_prevision ],
      [ @match.away_team, @match.away_prevision ]
    ]
  end 

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    @championnats = Championnat.all
    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  def edit
    @championnats = Championnat.all
    @match = Match.find(params[:id])
  end
  
  def update
    @match = Match.find(params[:id])
    @championnats = Championnat.all
    if @match.update(match_params)
      redirect_to @match
    else
      render 'edit'
    end
  end 

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path
  end

  private
  def match_params
    params.require(:match).permit(:matchday,:home_team,:home_prevision,:home_score,:draw_prevision,:away_team,:away_prevision,:away_score,:championnat_id)
  end
end