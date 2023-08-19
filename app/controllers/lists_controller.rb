class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  # app/controllers/lists_controller.rb

def index
  # Load lists and preload the first movie of each list.
  @lists_with_movies = List.left_joins(bookmarks: :movie)
                          .select('lists.id AS list_id, lists.name AS list_name, movies.poster_url, movies.id AS movie_id')
                          .group('lists.id, movies.id')
                          .order('lists.id, movies.id')
end


  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
