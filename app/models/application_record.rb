class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :current_page, -> (page) do
    paginate(:page => page, :per_page => per_page)
  end

end
