class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year_released
      t.string :consoles
      t.boolean :physical_release
      t.string :esrb_rating
      t.references :developer, foreign_key: true
      t.timestamps
    end
  end
end
