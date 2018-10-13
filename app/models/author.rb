class Author < Person
  has_many :lists, as: :listable, dependent: :destroy
  has_many :books, through: :lists, source: :book
  enum status: {whitelist: 1, blacklist: 0}
  def add_book book
    books << book
  end

  def remove_book book
    books.delete book
  end

  def book_exist? book
    books.include? book
  end

  def search name
    if name
       People.where(name: name)
    end
  end
end
