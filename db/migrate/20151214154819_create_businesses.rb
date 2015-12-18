class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :category
      t.attachment :image
      t.boolean :is_active
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end