require 'rails_helper'

RSpec.describe ReportType, type: :model do
  context 'validation tests' do
    it 'create ReportType without name ' do
    		expect(ReportType.create(name: nil)).to_not be_valid
    	end

  	it 'create ReportType with  name  langth > 30 symbols ' do  
  		expect(ReportType.create(name: 'a'* 205 )).to_not be_valid
  	end 

  	it "is valid with valid attributes" do
  	  	expect(ReportType.create(name: 'user is not friendly')).to be_valid
  	end
  end
end
