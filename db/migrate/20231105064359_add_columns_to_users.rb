class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :profile, :string
    add_column :users, :guitar_type, :string
    add_column :users, :years_experience, :integer
  end
end
