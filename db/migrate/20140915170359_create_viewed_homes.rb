class CreateViewedHomes < ActiveRecord::Migration
  def change
    create_table :viewed_homes do |t|
      t.integer :home_id
      t.integer :user_id
      t.boolean :favorite

      t.timestamps
    end
  end
end
