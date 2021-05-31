require 'rails_helper'

describe "ClassesController" do
  describe "Index endpoint" do
    it "hits dnd5eapi.co and returns list of classes" do
      get "/api/v1/dnd/classes"

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:results].count).to eq(12)
    end
  end
end
