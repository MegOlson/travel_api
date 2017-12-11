require 'rails_helper'

describe "put a destination route", :type => :request do

  before do
    @destination = FactoryBot.create(:destination)
    @destination.reload
  end

  # it "returns success response" do
  #   put :update, {:id => @destination.id, :city => "New Test City"}
  #   expect(response).to have_http_status(200)
  # end

end
