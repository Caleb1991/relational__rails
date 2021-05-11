class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :name
      t.integer :year_founded
      t.boolean :still_active
      t.string :city
      t.integer :number_of_staff

      t.timestamps
    end
  end
end
