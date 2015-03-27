class Product < ActiveRecord::Base
	has_many :users, through: :bid
end
