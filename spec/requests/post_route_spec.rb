require 'rails_helper'


describe "post a quote route", :type => :request do

  it "returns error response when fields are left blank" do
    post '/destinations', params: { city: "", country: ""}
    expect(response).to have_http_status(422)
  end

  before do
    post '/destinations', params: { :city => 'test_city', :country => "test_country" }
  end

  it "returns the destination city" do
    expect(JSON.parse(response.body)['city']).to eq 'test_city'
  end

  it "returns the destination country" do
    expect(JSON.parse(response.body)['country']).to eq 'test_country'
  end

  it "returns a created status" do
    expect(response).to have_http_status(:created)
  end
  
end
