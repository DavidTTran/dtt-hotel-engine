require 'rails_helper'

describe "PartyController" do
  describe "get /api/v1/dnd/parties" do
    it "displays an empty array without any parties" do
      get "/api/v1/dnd/parties"

      expect(response).to be_successful
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info).to eq([])
    end

    it "displays all parties" do
      Party.create(name: "Avengers")
      Party.create(name: "The Mighty Nine")

      get "/api/v1/dnd/parties"
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[0][:name]).to eq("Avengers")
      expect(info[1][:name]).to eq("The Mighty Nine")
    end
  end

  describe "post /api/v1/dnd/parties/new" do
    it "creates a party" do
      params = { name: "Heroes" }
      post "/api/v1/dnd/parties/", params: params

      expect(Party.count).to eq(1)
    end

    it "can't create a party with an existing name" do
      Party.create(name: "Heroes")
      params = { name: "Heroes" }

      post "/api/v1/dnd/parties/", params: params
      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:code]).to eq(400)
      expect(info[:messages][:name][0]).to eq("A party by the name Heroes already exists.")
    end
  end

  describe "patch /api/v1/dnd/parties/:id" do
    it "can update a party name" do
      party = Party.create(name: "The Mighty Nine")
      params = { name: "The Mighty Eight" }
      patch "/api/v1/dnd/parties/#{party.id}", params: params

      info = JSON.parse(response.body, symbolize_names: true)

      expect(info[:name]).to eq("The Mighty Eight")
    end
  end

  describe "delete /api/v1/dnd/parties/:id" do
    it "can delete a party given id" do
      party_1 = Party.create(name: "Justice League")
      party_2 = Party.create(name: "Big Hero 6")

      delete "/api/v1/dnd/parties/#{party_1.id}"

      expect(Party.count).to eq(1)
      expect(Party.all.first.name).to eq(party_2.name)
    end
  end
end
