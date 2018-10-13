class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    @books = @category.books.updated_desc.paginate page: params[:page],
      per_page: 12
  end

  def set_category
    @category = Category.find_by id: params[:id]
  end
end
