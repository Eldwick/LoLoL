class GamesController < ApplicationController
  def show
    @entries = Entry.where(list_id: params[:id])
    @game = Game.new(@entries)
    @list = List.find(params[:id])
  end

  def check
    render 'show'
  end
end


