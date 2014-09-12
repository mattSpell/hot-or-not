class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.string :photo_url
      t.string :list_price
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
