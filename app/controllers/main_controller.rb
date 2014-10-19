class MainController < ApplicationController
  def index
    @lists = List.limit(7500).to_json
  end
end
