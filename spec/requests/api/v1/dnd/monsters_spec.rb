require 'rails_helper'

describe "MonstersController" do
  describe "Index endpoint" do
    it "hits dnd5eapi.co and returns list of monsters" do
      get "/api/v1/dnd/monsters"

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:results].count).to eq(12)
    end
  end
end
