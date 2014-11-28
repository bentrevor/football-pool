class CreateGamesTeamsAndWeeks < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :home_team_id, null: false
      t.integer :away_team_id, null: false
      t.integer :home_team_score
      t.integer :away_team_score

      t.timestamps
    end

    create_table :teams do |t|
      t.string  :name, null: false
      t.integer :wins, null: false, default: 0
      t.integer :losses, null: false, default: 0
      t.integer :ties, null: false, default: 0

      t.timestamps
    end

    create_table :weeks do |t|
      t.integer :year, null: false
      t.integer :week_number, null: false
    end
  end
end
