class AddAttributesToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :message, :string

    add_reference :tweets, :user, foreign_key: true
  end
end
