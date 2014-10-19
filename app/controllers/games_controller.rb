class GamesController < ApplicationController
  def show
    @list = List.find(params[:id])
    @entries = Entry.where(list_id: @list.p_id)
    @game = Game.new(@entries)
    
  end

  def check
    render 'show'
  end
end


