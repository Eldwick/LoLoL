class ListsController < ApplicationController
  def index
   @lists = List.all
   @random = List.random
  end
  
  def show
  end
end
