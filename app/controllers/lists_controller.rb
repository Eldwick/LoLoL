class ListsController < ApplicationController
  def index
    @lists = List.limit(3500).to_json
  end

  def show
    @list = List.find(params[:id])
    @related_lists =  List.where(listoflist_id: @list.listoflist_id)
    render 'info', :layout => false
  end
  
  private

  def list_params
      params.require(:game).permit(:score, :list_id)
  end
end
