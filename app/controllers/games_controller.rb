class GamesController < ApplicationController
  def show
    @entries = Entry.where(list_id: params[:list_id])
    @game = Game.new(@entries)
  end

end


