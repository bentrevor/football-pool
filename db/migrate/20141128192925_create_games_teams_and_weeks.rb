class CreateGamesTeamsAndWeeks < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id
      t.integer :away_team_id
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end

    create_table :teams do |t|
      t.string  :name
      t.integer :wins
      t.integer :losses
      t.integer :ties

      t.timestamps
    end

    create_table :weeks do |t|
      t.integer :year
      t.integer :week_number
    end
  end
end
