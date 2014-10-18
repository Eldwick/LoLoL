class CreateListOfLists < ActiveRecord::Migration
  def change
    create_table :list_of_lists do |t|
      t.string :title

      t.timestamps
    end
  end
end
