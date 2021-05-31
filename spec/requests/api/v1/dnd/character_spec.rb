require 'rails_helper'

describe "CharactersController" do
  describe "get /api/v1/dnd/characters" do
    it "displays an empty array without any characters" do
      get "/api/v1/dnd/characters"

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data]).to eq([])
    end

    it "returns all character(s) and info" do
      create_list(:character, 3)

      get "/api/v1/dnd/characters"

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data].count).to eq(3)
      info[:data].each do |char|
        expect(char[:id]).to be_truthy
      end
    end
  end

  describe "post /api/v1/dnd/characters" do
    it "creates a character with valid info" do
      params = {
        name: "John Smith",
        level: 1,
        character_class: "rogue"
      }

      post "/api/v1/dnd/characters", params: params

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data][:attributes][:name]).to eq(params[:name])
      expect(info[:data][:id]).to be_truthy
    end
  end

  describe "patch /api/v1/dnd/characters" do
    it "can update character information" do
      char = create(:character)
      params = {
                 "name" => "John Smith",
                 "level" => 20,
                 "character_class" => "rogue",
               }
      patch "/api/v1/dnd/characters/#{char.id}", params: params

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data][:id].to_i).to eq(char.id)
      expect(info[:data][:attributes][:name]).to eq(params["name"])
      expect(info[:data][:attributes][:level]).to eq(params["level"])
      expect(info[:data][:attributes][:character_class]).to eq(params["character_class"])
    end

    it "can assign a character to a party" do
      char = create(:character)
      party = create(:party)

      expect(char.party_id).to be_falsey

      params = {
        "party_id" => party.id
      }

      patch "/api/v1/dnd/characters/#{char.id}", params: params

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:data][:attributes][:party_id]).to eq(party.id)
    end
  end

  describe "delete /api/v1/dnd/characters/:id" do
    it "deletes a character given a valid id" do
      char = create(:character)
      create(:character)

      delete "/api/v1/dnd/characters/#{char.id}"
      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(Character.all.count).to eq(1)
      expect(Character.where(id: char.id)).to eq([])
    end
  end
end
