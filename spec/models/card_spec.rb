require 'rails_helper'

RSpec.describe Card, type: :model do
	context 'vaidation tests' do 

		%i(cvv number month year designer_id).each do |attribute_name|
      it 'is not valid without params' do 
       	expect(build(:card, attribute_name =>  '' )).to_not be_valid 
     	end
    end


	  %i(44 %31 hfg #&% ).each do |attribute|
      it 'is not valid without a cvv' do 
       	expect(build(:card, cvv: attribute )).to_not be_valid 
     	end
    end

    %i(44235242424423523424 2423224664 242%4424$@%31 hfggdssgdsg #&%afsfasfHGDER ).each do |attribute|
		 	it "is not valid without a number" do
		 		expect(build(:card, number: attribute )).to_not be_valid
		 	end
		end

		%i(234 06 gf $# 6# g& ).each do |attribute|
		  it "is not valid without a month" do 
		  	expect(build(:card, month: attribute)).to_not be_valid
		  end
		end

		%i(234 06 gfasf $as# dd6# g&fdd 42345).each do |attribute|
		  it "is not valid without a year" do 
		  	expect(build(:card, year: attribute)).to_not be_valid
		  end
		end

	end
end
