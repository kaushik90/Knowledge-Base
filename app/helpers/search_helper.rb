module SearchHelper
	class ComplexQueries < ActiveRecord::Base
	  def self.my_query q
	    # Notice how you can, and should, still sanitize params here. 
	    self.connection.execute(sanitize_sql([q]))
	  end
	end
end