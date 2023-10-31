class AddUserImgToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_img, :string
    add_column :users, :string, :string
  end
end
