module RequestSpecHelper
  	# Parse JSON response to ruby hash
  	def json
    	JSON.parse(response.body)
  	end

  	def create_dummy_data
	    params = {
	      	height: 181,
	      	weight: 82,
	      	top_size: "S",
	      	trousers_size: "42",
	      	jacket_size: "52",
	      	shoes_size: "43"  
	    }
	    data = SIZES.keys.map{|key| { customer_id: 1, 
	    							  attribute_id: SIZES[key],
	    							  answer_type: ['height', 'weight'].include?(key) ? 'integer' : 'string',
	    							  value: params[key.to_sym]} }
	    Size.create data
	end

	def headers
		{
        	"Authorization" => nil,
        	"Content-Type" => "application/json",
        	'Accept': 'application/json'
        }
	end
end