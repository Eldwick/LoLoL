class ListsController < ApplicationController
  def index
    @lists = List.limit(3500).to_json
  end

  def show
    @lists = List.all
  end
  
end
