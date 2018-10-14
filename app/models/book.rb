class Book < ApplicationRecord
  belongs_to :user
  has_many :borrows
  has_many :bookmarks
  has_many :reviews
  has_many :lists
  has_many :authors, through: :lists, source: :info, source_type: Author.name
  has_many :categories, through: :lists, source: :info,
    source_type: Category.name
  has_many :borrowers, through: :borrows, source: :user
  has_many :reviewers, through: :reviews, source: :user
  has_many :bookmarkers, through: :bookmarks, source: :user

  def add_author author
    authors << author
  end

  def remove_author author
    authors.delete author
  end

  def author_exist? author
    authors.include? author
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
end
