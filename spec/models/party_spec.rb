require 'rails_helper'

describe Party do
  describe "model associations" do
    it { should have_many(:characters) }
  end
end
