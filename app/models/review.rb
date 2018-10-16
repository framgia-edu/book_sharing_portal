class Review < Interaction
  belongs_to :user
  belongs_to :book
  enum rating: [bad: 0, not_good: 1, good: 2, very_good: 3, excellent: 4]
end
