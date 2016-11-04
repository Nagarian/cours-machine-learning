# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ligue1 = Championnat.create(name: "Ligue 1")
# ligue2 = Championnat.create(name: "Ligue 2")
# ligue3 = Championnat.create(name: "Ligue 3")

# championnats = [ligue1, ligue2, ligue3]

# equipes = ["Paris", "Marseille", "Bordeaux", "Rennes"]

# championnats.each do | championnat |
#     (1..5).each do |indice|
#         home_predic = rand(0..50)
#         away_predic = rand(0..50)
#         home_team = equipes.sample
#         away_team = home_team
#         while away_team == home_team
#             away_team = equipes.sample
#         end

#         p home_team + " " + away_team
#         Match.create(
#             matchday: indice,
#             home_team: home_team,
#             home_prevision: home_predic,
#             home_score: rand(0..3),
#             draw_prevision: 100.0 - away_predic - home_predic,
#             away_team: away_team,
#             away_prevision: away_predic,
#             away_score: rand(0..3),
#             championnat: championnat
#         )
#     end
# end

require 'csv'
ActiveRecord::Import.require_adapter('mysql2')


fields_to_insert = %w{ HomeTeam FTHG AwayTeam FTAG }
rows_to_insert = []


ligue1 = Championnat.find(1)
files = ["2007_2008", "2008_2009","2009_2010","2010_2011","2011_2012","2012_2013","2013_2014","2014_2015","2015_2016","2016_2017"]

files.each do |file|
  matchday_compteur = 1
  matchday = 1
  CSV.foreach("public/data/" + file + ".csv", headers: true) do |row|
    row_pre_insert = row.to_hash.select { |k, v| fields_to_insert.include?(k) }
    
    # row_to_insert = [
    #     "matchday" => matchday,
    #     "championnat_year" => file,
    #     "home_team" => row_pre_insert["HomeTeam"],
    #     "home_prevision" => 0,
    #     "home_score" => row_pre_insert["FTHG"].to_i,
    #     "draw_prevision" => 0,
    #     "away_team" => row_pre_insert["AwayTeam"],
    #     "away_score" => row_pre_insert["FTAG"].to_i,
    #     "away_prevision" => 0,
    #     "championnat_id" => ligue1.id
    # ]

    Match.create(
        matchday: matchday,
        championnat_year: file,
        home_team: row_pre_insert["HomeTeam"],
        home_prevision: 0,
        home_score: row_pre_insert["FTHG"].to_i,
        draw_prevision: 0,
        away_team: row_pre_insert["AwayTeam"],
        away_score: row_pre_insert["FTAG"].to_i,
        away_prevision: 0,
        championnat_id: ligue1.id
    )

    # rows_to_insert << row_to_insert

    if matchday_compteur < 10
        matchday_compteur += 1
    else
        matchday += 1
        matchday_compteur = 1
    end
  end
end

# Match.import(rows_to_insert)