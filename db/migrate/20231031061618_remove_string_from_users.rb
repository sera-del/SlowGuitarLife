class RemoveStringFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :string, :string
    remove_column :users, :string, :string
  end
end
