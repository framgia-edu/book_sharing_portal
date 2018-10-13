class AuthorsController < ApplicationController
  before_action :set_author, only: [:show]

  def show
    @books = @author.books.updated_desc.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def set_author
    @author = Author.find_by id: params[:id]
  end
end
