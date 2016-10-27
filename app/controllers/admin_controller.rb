class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
    @datas = []
    Championnat.each do |championnat|
      championnat.matches.each do |match|
        @datas.push([championnat.name, match.home_score > match.away_score ? match.home_team : match.home_score == match.away_score ? "draw" : match.away_team])
      end
    end
  end

  def github
    system('git pull')
    render :nothing => true, :status => :ok
  end
end