class User < Person
  devise :omniauthable, omniauth_providers: [:facebook, :google_oauth2,
   :twitter]
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  has_many :borrows
  has_many :books
  has_many :bookmarks
  has_many :reviews
  has_many :borrow_books, through: :borrows, source: :book
  has_many :mark_books, through: :bookmarks, source: :book
  has_many :review_books, through: :reviews, source: :book

  def add_bookmark book
    mark_books << book
  end

  def remove_bookmark book
    mark_books.delete book
  end

  def bookmark_exist? book
    mark_books.include? book
  end

  def add_review book, rating, comment
    Review.create book_id: book.id, user_id: id, rating: rating,
      comment: comment
  end

  def remove_review book
    review_books.delete book
  end

  def review_exist? book
    review_books.include? book
  end

  def add_borrow book
    borrow_books << book
  end

  def remove_borrow book
    borrow_books.delete book
  end

  def borrow_exist? book
    borrow_books.include? book
  end
end
