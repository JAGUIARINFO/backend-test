require 'rails_helper'

RSpec.describe "Complains", type: :request do
  describe "GET /complains" do
    it "Access API Success" do
      get "/api/v1/complains"
      expect(response).to have_http_status(200)
    end
    it "Access API Fail" do
      get "/api/v1/complains"
      expect(response).to_not have_http_status(404)
    end
  end
  describe "PUT /complains" do
    let(:complain) { create(:complain) }
    let(:complain_attributes) { attributes_for(:complain) }
    
    it "Create Complain Success" do
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to have_http_status(200)
    end
    it "Create Complain Fail (without title)" do
      complain_attributes[:title] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
    it "Create Complain Fail (without description)" do
      complain_attributes[:description] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
    it "Create Complain Fail (without city)" do
      complain_attributes[:city] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
    it "Create Complain Fail (without state)" do
      complain_attributes[:state] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
    it "Create Complain Fail (without country)" do
      complain_attributes[:country] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
    it "Create Complain Fail (without company)" do
      complain_attributes[:company] = ""
      put "/api/v1/complains/#{complain.id}", params: complain_attributes
      expect(response).to_not have_http_status(200)
    end
  end
  describe "Filter Complains" do
    before(:each) do
      Rails.application.load_seed
    end
    it "Count Complains with Filter City" do
      get "/api/v1/complains/?city=test city 2"
      expect(response.body).to eq('3')
    end
    it "Count Complains with Filter Company" do
      get "/api/v1/complains/?company=test company 4"
      expect(response.body).to eq('2')
    end
    it "Count Complains with Filter City and Company" do
      get "/api/v1/complains/?city=test city 2&company=test company 3"
      expect(response.body).to eq('1')
    end
  end
end
 
