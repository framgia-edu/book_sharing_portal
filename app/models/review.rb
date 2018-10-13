class Review < Interaction
  belongs_to :user
  belongs_to :book
  scope :updated_desc, ->{order updated_at: :desc }
end
