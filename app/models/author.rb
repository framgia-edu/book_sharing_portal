class Author < Person
  has_many :lists, as: :info, class_name: Author.name, dependent: :destroy
  has_many :books, through: :lists, source_type: Author.name, source: :book
  enum status: [active: 1, blacklist: 0]
end
