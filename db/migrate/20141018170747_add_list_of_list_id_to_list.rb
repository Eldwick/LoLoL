class AddListOfListIdToList < ActiveRecord::Migration
  def change
    add_column :lists, :listoflist_id, :integer
  end
end
