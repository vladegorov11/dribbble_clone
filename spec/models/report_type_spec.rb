require 'rails_helper'

RSpec.describe ReportType, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it 'create ReportType without name '
  		expect(ReportType.new(name: nil)).to_not be_valid
  	end

	it 'create ReportType with  name  langth > 30 symbols '  
		expect(ReportType.new(name: 'a'* 205 )).to_not be_valid
	end 

	it "is valid with valid attributes" do
	  	expect(ReportType.new(name: 'user is not friendly')).to be_valid
	end

	it "orders them in reverse chronologically" do
      # report_type = ReportType.create!(name:  "user is not friendly")
      # report = report_type.reports.create!(:body => "first comment")
      # report2 = report_type.reports.create!(:body => "second comment")
      # expect(post.reload.comments).to eq([comment2, comment1])
    end

end
