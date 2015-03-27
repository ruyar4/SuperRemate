class Product < ActiveRecord::Base
	has_many :bid
	has_many :users, through: :bid

	validates :price, presence: true
end
