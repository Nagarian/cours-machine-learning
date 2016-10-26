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

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 40,
    home_score: 2,
    draw_prevision: 20,
    away_team: "Bordeaux",
    away_prevision: 40,
    away_score: 4,
    championnat: ligue1
)

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 40,
    home_score: 2,
    draw_prevision: 20,
    away_team: "Bordeaux",
    away_prevision: 40,
    away_score: 4,
    championnat: ligue2
)

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 30,
    home_score: 1,
    draw_prevision: 20,
    away_team: "Marseille",
    away_prevision: 70,
    away_score: 1,
    championnat: ligue1
)

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 40,
    home_score: 2,
    draw_prevision: 20,
    away_team: "Bordeaux",
    away_prevision: 40,
    away_score: 4,
    championnat: ligue1
)

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 40,
    home_score: 2,
    draw_prevision: 20,
    away_team: "Bordeaux",
    away_prevision: 40,
    away_score: 4,
    championnat: ligue3
)

Match.create(
    matchday: 1,
    home_team: "Paris",
    home_prevision: 40,
    home_score: 2,
    draw_prevision: 20,
    away_team: "Bordeaux",
    away_prevision: 40,
    away_score: 4,
    championnat: ligue2
)