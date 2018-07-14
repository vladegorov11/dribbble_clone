class Search
	attr_accessor :initial_args

  def initialize(initial_args)
    @initial_args = initial_args
    @result = {}
  end


  def call (search_params)
  	search( search_params,  initial_args)
  end

  private 
  
  def search (search_params , args)
  	args.each do  |model|
      res = model.search_everywhere(search_params)
      res.present? ? @result.merge!(Hash[res.name.to_sym, res]) : next
  	end
  	@result
  end
end

