module Filterable
  extend ActiveSupport::Concern

  module ClassMethods

    DEFAULT_PARAMS = { "date"=>"week", "sort"=>"default", "list"=>"all"}

    def filter(filtering_params = {})
      results = self.where(nil)
        merge_params(filtering_params).each do |key, value|
          results = results.send("#{value}")
        end
      return results
    end

    def merge_params(params)
      result = DEFAULT_PARAMS.merge(params)
    end
  end
end
