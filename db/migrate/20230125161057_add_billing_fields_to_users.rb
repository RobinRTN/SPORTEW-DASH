class AddBillingFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :billing_address, :string
    add_column :users, :billing_city, :string
    add_column :users, :billing_country, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
