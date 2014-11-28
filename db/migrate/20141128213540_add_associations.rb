class AddAssociations < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.belongs_to :week
    end
  end
end
