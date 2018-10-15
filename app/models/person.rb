class Person < ApplicationRecord
	scope :authors, ->{where type: "Author"}
  scope :users, ->{where type: "User"}
  scope :admins, ->{where type: "Admin"}

  def self.type
    %w(Author User Admin)
  end
end
