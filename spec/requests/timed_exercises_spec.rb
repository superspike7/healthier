require 'rails_helper'

RSpec.describe "TimedExercises", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/timed_exercises/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/timed_exercises/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/timed_exercises/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/timed_exercises/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
