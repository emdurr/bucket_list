require 'rails_helper'

RSpec.describe Item, type: :model do
	describe "Item" do
  	it { should belong_to(:list) }

	end

		describe "attributes" do
		it { should respond_to(:item_name)}
		it { should respond_to(:description)}
	end

end
