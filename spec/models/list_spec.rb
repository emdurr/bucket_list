require 'rails_helper'

RSpec.describe List, type: :model do

  describe "List" do
  	it { should have_many(:items) }
  	it { should belong_to(:user) }

	end
	describe "attributes" do
		it { should validate_presence_of(:name) }
		it { should respond_to(:name)}
		it { should respond_to(:activity_type)}
		it { should respond_to(:in_progress)}
		it { should respond_to(:user_id)}
		it { should respond_to(:complete)}
	end

	describe ".search" do
		it "return results" do
			u1 = User.create(first_name: 'Eric', last_name: 'Durr', email: 'test@test.com', password: 'password', password_confirmation: 'password')
			l1 = List.create(name: 'to do', user_id: 1)
			l2 = List.create(name: 'this is what we do', user_id: 1)
			l3 = List.create(name: 'Doing this', user_id: 1)
			l4 = List.create(name: 'to do', user_id: 1)
			search = 'to do'
			searched_lists = List.search(search)
			expect(searched_lists.first).to eq(l1)
			expect(searched_lists.last).to eq(l4)
		end
	end

end
