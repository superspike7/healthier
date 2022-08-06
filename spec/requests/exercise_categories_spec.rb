require 'rails_helper'

RSpec.describe "ExerciseCategories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/exercise_categories/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/exercise_categories/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/exercise_categories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/exercise_categories/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
