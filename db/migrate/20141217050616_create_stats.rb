class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :current_standing
      t.integer :games_won
      t.decimal :games_won_percent
      t.integer :games_won_last_week

      t.belongs_to :user
      t.belongs_to :week

      t.timestamps
    end
  end
end
