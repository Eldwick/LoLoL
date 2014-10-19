class ListsController < ApplicationController
  def index
    if params[:search]
      @lists = List.search(params[:search])
    else
      @lists = List.all
    end
    @random = List.random
  end

  def show
    @lists = List.all
  end
  
end
