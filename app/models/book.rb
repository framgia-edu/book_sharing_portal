class Book < ApplicationRecord
  belongs_to :user
  has_many :borrows, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :lists
  has_many :people, through: :lists, source: :listable, source_type: Person.name
  has_many :categories, through: :lists, source: :listable,
    source_type: Category.name
  has_many :borrowers, through: :borrows, source: :user
  has_many :reviewers, through: :reviews, source: :user
  has_many :bookmarkers, through: :bookmarks, source: :user
  enum status: [inactive: 0, active: 1]
  mount_uploader :cover, CoverUploader
  mount_uploader :content, ContentUploader
  scope :updated_desc, ->{order updated_at: :desc }

  def add_author author
    people << author
  end

  def remove_author author
    people.delete author
  end

  def author_exist? author
    people.include? author
  end

  def add_category category
    categories << category
  end

  def remove_category category
    categories.delete category
  end

  def category_exist? category
    categories.include? category
  end

  def add_review user, rating, comment
    Review.create book_id: self.id, user_id: user.id, rating: rating,
      comment: comment
  end

  def remove_review book
    review_books.delete book
  end

  def review_exist? book
    review_books.include? book
  end
end
