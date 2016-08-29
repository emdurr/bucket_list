class List < ApplicationRecord
	has_many :items, dependent: :destroy
	belongs_to :user
	validates_presence_of :name

	def self.search(search)

  	List.where(name:search)
    
  end
end
