class AdminController < ApplicationController
  layout 'admin'
  
  def index
    @matches = Match.all
    @datas = []
    Championnat.all.each do |championnat|
      arr = []
      championnat.matches.where.not('home_score' => nil).each do |match|
        arr.push(match.home_score > match.away_score ? match.home_team : match.home_score == match.away_score ? "draw" : match.away_team)
      end
      
      arr2 = []
      
      arr.uniq.each do |a|
        arr2.push([a, arr.count(a)])
      end
      
      @datas.push({name: championnat.name, data: arr2})
    end

    # @data2 = []
    # Championnat.all.each do |championnat|
    #   championnat.matches.each do |match|
    #     winner = match.home_score > match.away_score ? match.home_team : match.home_score == match.away_score ? "draw" : match.away_team
    #     @data2.push({ championnat: championnat.name, winner: winner})
    #   end
    # end

    # @data2.group(:championnat).count()
  end

  def predict
    PredictionJob.perform_async()
    redirect_to admin_path
  end

  def github
    system('git pull')
    render :nothing => true, :status => :ok
  end
end