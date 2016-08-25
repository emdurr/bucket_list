class List < ApplicationRecord
	has_many :items
	belongs_to :user

	def self.search(search)

  	List.where(name:search)
    
  end
end
