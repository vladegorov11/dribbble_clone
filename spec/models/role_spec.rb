require 'rails_helper'

RSpec.describe Role, type: :model do
    context 'validation tests' do 
    	it 'is not valid without a name ' do
    		expect(Role.create(name: nil)).to_not be_valid
    	end

    	it 'add role that already exists' do 
    		role = Role.create(name: "admin")
    		role1 = Role.create(name: "admin")
    		expect(role1).to_not be_valid
    	end 

    	it 'add role is missing on ROLE_NAMES' do 
    		expect(Role.create(name: "admin1")).to_not be_valid
      end 

      it "is valid with valid attributes" do
  	  	expect(Role.create(name: "vip")).to be_valid
  		end
    end
end

