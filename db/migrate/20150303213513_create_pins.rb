class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.string :description
      t.string :url
      

      t.timestamps null: false
    end
  end
end
