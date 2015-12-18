class AddFieldsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :facebook, :string
  	add_column :users, :linked_in, :string
  	add_column :users, :twitter, :string
  end
end
