require 'rails_helper'

describe "CharactersController" do
  describe "get /api/v1/dnd/characters" do
    it "displays an empty array without any characters" do
      get "/api/v1/dnd/characters"

      info = JSON.parse(response.body, symbolize_names: true)

      expect(info).to eq([])
    end

    it "returns all character(s) and info" do
      create_list(:character, 3)

      get "/api/v1/dnd/characters"
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info.count).to eq(3)
      info.each do |char|
        expect(char[:id]).to be_truthy
      end
    end
  end
end
