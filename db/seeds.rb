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
    [0..5].each do |indice|
        home_predic = [0..50].sample
        away_predic = [0..50].sample
        Match.create(
            matchday: indice,
            home_team: equipes.sample,
            home_prevision: home_predic,
            home_score: [0..3].sample,
            draw_prevision: 100 - away_predic - home_predic,
            away_team: equipes.sample,
            away_prevision: away_predic,
            away_score: [0..3].sample,
            championnat: championnat
        )
    end
end