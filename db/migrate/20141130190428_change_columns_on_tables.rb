#TODO more generic migration name
class ChangeColumnsOnTables < ActiveRecord::Migration
  def change
    rename_column :picks, :home_team, :is_home_team
    add_column :games, :kickoff_time, :timestamp, null: false
  end
end
