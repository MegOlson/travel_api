require 'rails_helper'


describe "delete a destination route" do

  before do
    post '/api/v1/destinations', params: { :city => 'test_city', :country => "test_country" }, headers: {Authorization: 'Basic ZGhoOnBhc3N3b3Jk'}
  end

  it "returns the destination city" do
    id = JSON.parse(response.body)['id']
    delete '/api/v1/destinations/id', headers: {Authorization: 'Basic ZGhoOnBhc3N3b3Jk'}
    expect(response).to have_http_status(404)
  end

end
