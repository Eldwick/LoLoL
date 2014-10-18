class GamesController < ApplicationController
  def show
    @entries = Entry.where(list_id: params[:id])
    @game = Game.new(@entries)
  end

  def check
    render 'show'
  end
end


