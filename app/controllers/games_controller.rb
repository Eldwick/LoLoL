class GamesController < ApplicationController

respond_to :html, :js

  def show
    @entries = Entry.where(list_id: params[:id])
    @game = Game.new.setup(@entries)
    @list = List.find(params[:id])
  end

  def newscore
    Game.create(score: params[:score], list_id: params[:list_id])
    @highscores = Game.where(list_id: params[:list_id]).order('score DESC').limit(5)
    render 'highscores', :layout => false

  end

private
  def game_params
    	params.require(:game).permit(:score, :list_id)
  end

end