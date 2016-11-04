class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t| 
      t.integer :matchday         # journée de championnat
      t.string :championnat_year # année de championnat
      t.string :home_team         # équipe à domicile
      t.float :home_prevision     # prévision score domicile
      t.integer :home_score       # score réel domicile
      t.float :draw_prevision     # prévision match nul
      t.string :away_team         # équipe à l'extérieur
      t.float :away_prevision     # prévision score extérieur
      t.integer :away_score       # score réel extérieur
      t.timestamps null: false
      t.belongs_to :championnat, index: true  # championnat_id
      t.timestamps null: false 
    end
  end
end
