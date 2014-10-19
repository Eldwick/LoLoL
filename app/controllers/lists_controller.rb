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
    @entries = Entry.all
  end

  def destroy_multiple

    List.destroy(params[:lists])

    respond_to do |format|
      format.html { redirect_to lists_show_path }
      format.json { head :no_content }
    end

  end
end
