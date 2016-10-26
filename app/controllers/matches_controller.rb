class MatchesController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
  end
  
  def show
    @match = Match.find(params[:id])
  end 

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path
    else
      render 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end
  
  def update
    @match = Match.find(params[:id])
    if @match.update(matches_path)
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
    params.require(:match).permit(:matchday)
    params.require(:match).permit(:home_team)
    params.require(:match).permit(:home_prediction)
    params.require(:match).permit(:home_score)
    params.require(:match).permit(:draw_prediction)
    params.require(:match).permit(:away_team)
    params.require(:match).permit(:away_prediction)
    params.require(:match).permit(:away_score)
  end
end
