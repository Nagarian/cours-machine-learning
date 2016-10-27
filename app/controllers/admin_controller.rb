class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
    @datas = []
    Championnat.all.each do |championnat|
      arr = []
      championnat.matches.each do |match|
        arr.push(match.home_score > match.away_score ? match.home_team : match.home_score == match.away_score ? "draw" : match.away_team)
      end
      
      arr2 = []
      
      arr.uniq.each do |a|
        arr2.push([a, arr.count(a)])
      end
      
      @datas.push({name: championnat.name, value: arr2})
    end
  end

  def github
    system('git pull')
    render :nothing => true, :status => :ok
  end
end