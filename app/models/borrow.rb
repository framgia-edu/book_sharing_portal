class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  enum status: {unagree: 0, agree: 1}
end
