class ReviewsController < ApplicationController

  def create
    create_review
    redirect_to @book
  end

  def create_review
    @book = Book.find_by id: params[:book_id]
    user = User.find_by id: params[:user_id]

    if user.review_exist? @book
      review = user.reviews.find_by book_id: @book.id
      review.update_attributes rating: params[:rating], comment: params[:comment]
      review.save
    else
      Review.create book_id: params[:book_id], user_id: params[:user_id],
       rating: params[:rating], comment: params[:comment]
    end
  end
end
