class Category < ApplicationRecord
  has_many :lists, as: :listable, dependent: :destroy
  has_many :books, source: :book, through: :lists
  enum status: {active: 1, blacklist: 0}

  def add_book book
    books << book
  end

  def remove_book book
    books.delete book
  end

  def book_exist? book
    books.include? book
  end
end
