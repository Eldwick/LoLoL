class AddPIdAndGameToList < ActiveRecord::Migration
  def change
    add_column :lists, :p_id, :integer
    add_column :lists, :game, :boolean
  end
end
