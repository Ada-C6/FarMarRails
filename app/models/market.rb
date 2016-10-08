class Market < ActiveRecord::Base
	has_many :vendors

	# name cannot be blank
	validates :name, presence: true
	# address cannot be blank
	validates :address, presence: true
	# state cannot be blank
	validates :state, presence: true
	# zip cannot be blank
	validates :zip, presence: true
#other potential validations:
	# make sure zip code is strictly numbers

end
