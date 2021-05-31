require 'rails_helper'

describe Party, type: :model do
  describe "associations" do
    it { should have_many(:characters) }
  end

  describe "average_level" do
    it "automatically updates based on characters levels(?)" do
      
    end
  end
end
