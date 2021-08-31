class AddBodyToChills < ActiveRecord::Migration[6.1]
  def change
    add_column :chills, :title, :string
  end
end
