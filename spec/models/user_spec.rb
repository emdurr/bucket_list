require 'rails_helper'

RSpec.describe User, type: :model do

	describe "attributes" do
		it { should respond_to(:first_name)}
		it { should respond_to(:last_name)}
	end


end
