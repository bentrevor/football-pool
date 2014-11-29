class AddUsersAndPicks < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email

      t.timestamps
    end

    create_table :picks do |t|
      t.boolean    :home_team
      t.belongs_to :game
      t.belongs_to :user

      t.timestamps
    end
  end
end
