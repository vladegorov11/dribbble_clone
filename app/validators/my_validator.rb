class MyValidator < ActiveModel::Validator
  def validate(record)
    designer = Designer.find(record.designer_id)
    puts designer.shots.count 
    if designer.shots.count > 10 
      record.errors[:base] << 'bla bla bla'
    end
  end
end
