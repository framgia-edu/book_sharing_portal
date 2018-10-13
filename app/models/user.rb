class User < Person
  devise :omniauthable, omniauth_providers: [:facebook]
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable
  has_many :borrows, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :borrow_books, through: :borrows, source: :book
  has_many :mark_books, through: :bookmarks, source: :book
  has_many :review_books, through: :reviews, source: :book
  enum status: {whitelist: 1, blacklist: 0}
  mount_uploader :avatar, AvatarUploader

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

  def add_book book
    books << book
  end

  def remove_book book
    books.delete book
  end

  def book_exist? book
    books.include? book
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.remote_avatar = auth.info.image
      puts auth.info.image
    end
  end
end
