class AddFirstNameLastNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :user, :first_name, :string
    add_column :user, :last_name, :string
    add_column :user, :address, :string
  end
end
