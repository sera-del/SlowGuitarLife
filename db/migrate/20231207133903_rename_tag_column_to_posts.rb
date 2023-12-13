class RenameTagColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :tag, :video
  end
end
