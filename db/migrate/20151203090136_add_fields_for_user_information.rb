class AddFieldsForUserInformation < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :street_address, :string
    add_column :users, :city, :string
    add_column :users, :sub_division_of_country, :string
    add_column :users, :country, :string
    add_column :users, :postal_code, :integer
  end
end
