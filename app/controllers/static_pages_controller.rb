class StaticPagesController < ApplicationController
  def home
    @books = Book.all.updated_desc.paginate page: params[:page], per_page: 12
  end

  def gallery; end

  def contact; end
end
