class AddReceiveTextsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :receive_texts, :boolean
  end
end
