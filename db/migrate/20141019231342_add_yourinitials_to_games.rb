class AddYourinitialsToGames < ActiveRecord::Migration
  def change
    add_column :games, :yourinitials, :string
  end
end
