class ListsController < ApplicationController
  def index
   @lists = List.all
   @random = list.random
  end
  
  def show
  end
end
