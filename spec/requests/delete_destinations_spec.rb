require 'rails_helper'

describe "delete a destination route" do

  before do
    post '/destinations', params: { :city => 'test_city', :country => "test_country" }
  end

  it "returns the destination city" do
    id = JSON.parse(response.body)['id']
    delete '/destinations/id'
    expect(response).to have_http_status(404)
  end

end
