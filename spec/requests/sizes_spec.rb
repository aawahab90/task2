require 'rails_helper'

RSpec.describe 'Sizes API', type: :request do
	describe 'GET /customer/:customer_id/sizes' do
		before { create_dummy_data }
		context 'with valid data' do
      		# make HTTP get request before each example
      		before { get "/customer/1/sizes", headers: headers }

	     	it 'returns sizes' do
	        	# Note `json` is a custom helper to parse JSON responses
	        	expect(json).not_to be_empty
	        	expect(json['height']).not_to be_empty
	      	end

      		it 'returns status code 200' do
        		expect(response).to have_http_status(200)
      		end
    	end

    	context 'with invalid id' do
      		it 'returns not found' do
		        get "/customer/0/sizes", headers: headers
		        expect(json['message']).to  eq("Sorry, Record with id=0 not found.")
		    end
    	end
	end

	describe 'PUT /customer/:customer_id/sizes' do
		before { create_dummy_data }
		context 'with valid data' do
      		# make HTTP get request before each example
      		before { put "/customer/1/sizes", headers: headers, params: { height: '5.9'}.to_json }

	     	it 'returns Success message' do
	        	# Note `json` is a custom helper to parse JSON responses
	        	expect(json).not_to be_empty
	        	expect(json['message']).to eq('Sizes are successfully updated')
	      	end
    	end

    	context 'with invalid id' do
      		it 'returns not found' do
		        get "/customer/0/sizes", headers: headers
		        expect(json['message']).to  eq("Sorry, Record with id=0 not found.")
		    end
    	end
	end
end