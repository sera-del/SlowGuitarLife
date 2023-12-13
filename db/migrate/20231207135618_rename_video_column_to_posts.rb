class RenameVideoColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    rename_column :posts, :video, :youtube_url
  end
end
