class AddAttributesToSessions < ActiveRecord::Migration[6.1]
  def change
    add_column :sessions, :token, :string

    add_belongs_to :sessions, :user
  end
end
