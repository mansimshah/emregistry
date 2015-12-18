class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :location
      t.string :type_of_services
      t.string :description
      t.integer :cost
      t.boolean :is_active	
      t.belongs_to :business, index: true
      t.timestamps null: false
    end
  end
end