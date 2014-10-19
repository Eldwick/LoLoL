class AddPIdToListOfList < ActiveRecord::Migration
  def change
    add_column :list_of_lists, :p_id, :integer
  end
end
