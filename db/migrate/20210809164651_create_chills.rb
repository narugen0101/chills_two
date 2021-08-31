class CreateChills < ActiveRecord::Migration[6.1]
  def change
    create_table :chills do |t|
      t.text :body

      t.timestamps
    end
  end
end
