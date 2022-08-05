require 'rails_helper'

RSpec.describe "RepExercises", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/rep_exercises/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/rep_exercises/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/rep_exercises/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/rep_exercises/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
