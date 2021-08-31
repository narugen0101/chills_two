class AddYoutubeInfoToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :youtube_url, :string
  end
end
