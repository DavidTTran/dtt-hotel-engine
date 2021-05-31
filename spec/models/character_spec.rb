require 'rails_helper'

describe Character do
  describe "associations" do
    it "validates attributes" do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:level) }
      it { should validate_presence_of(:class) }
    end
  end
end
