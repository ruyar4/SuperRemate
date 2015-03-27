class Product < ActiveRecord::Base
	before_save :default_values

	has_many :bid
	has_many :users, through: :bid

	validates :price, presence: true


	def default_values
	   self.status ||= 'en remate'
	end
end
