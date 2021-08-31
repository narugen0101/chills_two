class ChangeDataSringToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column :posts, :title, :text
  end
end
