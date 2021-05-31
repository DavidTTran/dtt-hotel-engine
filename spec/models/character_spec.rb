require 'rails_helper'

describe Character do
  describe "create" do
    it "requires name level and class" do
      john = Character.new(name: "John", character_class: "paladin", level: 1)

      expect(john.save).to eq(true)
      expect(john.id).to be_truthy
    end

    it "defaults level to 1 when not provided" do
      john = Character.new(name: "John", character_class: "paladin")

      expect(john.save).to eq(true)
      expect(john.level).to eq(1)
    end

    it "requires a valid class" do
      john = Character.new(name: "John", character_class: "INVALID")

      expect(john.save).to eq(false)
      expect(john.errors.messages[:character_class][0]).to eq("INVALID is not a valid class.")
    end

    it "requires a valid level" do
      john = Character.new(name: "John", character_class: "paladin", level: -1)
      smith = Character.new(name: "John", character_class: "paladin", level: 21)

      expect(john.save).to eq(false)
      expect(smith.save).to eq(false)
    end
  end
end
