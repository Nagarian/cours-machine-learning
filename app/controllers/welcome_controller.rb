class WelcomeController < ApplicationController
  def index
    @championnat = Championnat.find_by(name: "Ligue 1")
  end
end
