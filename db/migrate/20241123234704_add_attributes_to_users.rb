class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    # add_index :users, :username, unique: true

    add_column :users, :email, :string
    # add_index :users, :email, unique: true

    add_column :users, :password, :string
  end
end
