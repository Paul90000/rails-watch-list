class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark added successfully.'
    else
      render :new
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
