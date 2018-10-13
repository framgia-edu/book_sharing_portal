class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_book, only: [:show, :update, :destroy, :edit]
  def index
    @books = search params[:search]
  end

  def show
    @reviews = @book.reviews.updated_desc.paginate page: params[:page],
     per_page: 10
    if current_user
    @review = current_user.reviews.find_by book_id: @book.id
    if @review
      @user_rating = @review.rating
      @user_comment = @review.comment
    else
      @user_rating = 0
      @user_comment = ""
    end
    end
    @rating = rating
  end

  def new
    @book = current_user.books.new
  end

  def create
    @book = current_user.books.build book_params
    @book.save
    redirect_to @book
  end

  def edit
    render :new
  end

  def update
    if @book.update book_params
      flash[:success] = "update success"
      @book.save
    else
      flash[:danger] = "update fail"
    end
    redirect_to edit_book_url
  end

  def destroy
    if @book.destroy
      flash[:success] = "destroy success"
    else
      flash[:danger] = "destroy fail"
    end
    redirect_to current_user
  end

  def book_params
    params.require(:book).permit :name, :cover, :content, :quantity, :introduce
  end

  def set_book
    @book = Book.find_by id: params[:id]
  end

  def rating
    sum = 0
    size = @book.reviews.all.length
    if @reviews.length > 0
      @reviews.each do |review|
        sum = sum + review.rating
      end
      sum = sum/size
    end
    return sum
  end
end
