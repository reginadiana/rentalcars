class Customer < ApplicationRecord
	validates :document, :email, uniqueness: true
	validates :name, :document, :email, presence: true
	scope :search, ->(query) { where('name LIKE ?', "%#{query}%")
                              .or(where(document: query)) }
end
