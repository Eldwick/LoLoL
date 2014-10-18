class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :text
      t.integer :list_id

      t.timestamps
    end
  end
end
