class AddUserIdToStays < ActiveRecord::Migration[5.0]
  def change
    add_column :stays, :user_id, :integer
    add_index :stays, :user_id
  end
end
