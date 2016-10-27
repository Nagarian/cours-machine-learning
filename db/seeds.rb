# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ligue1 = Championnat.create(name: "Ligue 1")
ligue2 = Championnat.create(name: "Ligue 2")
ligue3 = Championnat.create(name: "Ligue 3")

championnats = [ligue1, ligue2, ligue3]

equipes = ["Paris", "Marseille", "Bordeaux", "Rennes"]

championnats.each do | championnat |
    (1..5).each do |indice|
        home_predic = rand(0..50)
        away_predic = rand(0..50)
        home_team = equipes.sample
        away_team = home_team
        while away_team == home_team
            away_team = equipes.sample
        end

        p home_team + " " + away_team
        Match.create(
            matchday: indice,
            home_team: home_team,
            home_prevision: home_predic,
            home_score: rand(0..3),
            draw_prevision: 100.0 - away_predic - home_predic,
            away_team: away_team,
            away_prevision: away_predic,
            away_score: rand(0..3),
            championnat: championnat
        )
    end
end