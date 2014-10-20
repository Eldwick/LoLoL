class GamesController < ApplicationController

respond_to :html, :js

  def show
    @list = List.find(params[:id])
    @entries = Entry.where(list_id: @list.p_id)
    @game = Game.new.setup(@entries)
    
  end

  def newscore
    @yourgame = Game.create(score: params[:score], list_id: params[:list_id])
    @highscores = Game.where(list_id: params[:list_id]).order('score DESC').limit(5)

    render 'highscores', :layout => false
  end

  def updatescore
    game = Game.find(params[:game_id])
    game.update(yourinitials: params[:yourinitials])

    render nothing: true
  end

private
  def game_params
    	params.require(:game).permit(:score, :list_id, :yourinitials, :game_id)
  end

end
