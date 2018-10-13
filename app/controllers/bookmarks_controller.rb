class BookmarksController < ApplicationController
  before_action :set_book, only: [:create]
  def create
    if current_user.bookmark_exist? @book
      flash[:success] = "bạn đã hủy thành công"
      current_user.remove_bookmark @book
    else
      current_user.add_bookmark @book
      flash[:success] = "bạn đã bookmark thành công"
    end
    redirect_to @book
  end

  def destroy

  end

  def set_book
    @book = Book.find_by id: params[:id]
  end
end
