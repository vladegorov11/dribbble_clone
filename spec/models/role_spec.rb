require 'rails_helper'

RSpec.describe Role, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
    context 'validation tests' do 
    	it 'is not valid without a name '
    		expect(Role.new(name: nil)).to_not be_valid
    	end

    	it 'add role that already exists'  
    		role = Role.new(name: "admin")
    		role1 = Role.new(name: "admin")
    		expect(role1).to_not be_valid
    	end 

    	it 'add role is missing on ROLE_NAMES'
    		expect(Role.new(name: "admin1")).to_not be_valid
      end 

      it "is valid with valid attributes" do
  	  	expect(Role.new(name: "vip")).to be_valid
  		end
    end
end

