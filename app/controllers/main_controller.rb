class MainController < ApplicationController
  def index
    @lists = List.all.to_json
  end
end
