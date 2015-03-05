class AddPinimageToPins < ActiveRecord::Migration
  def change
    add_column :pins, :pinimage, :string
  end
end
