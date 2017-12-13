require 'rails_helper'

describe "get all destinations route", :type => :request do
  let!(:destinations) { FactoryBot.create_list(:destination, 20) }

  before { get '/api/v1/destinations', headers: {Authorization: ENV['TRAVEL_API_KEY']}}

  it 'returns all destinations' do
    expect(JSON.parse(response.body).size).to eq 20
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end



end
