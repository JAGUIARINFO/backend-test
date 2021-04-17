require 'rails_helper'

RSpec.describe Complain, type: :model do
  context "Complain Validate" do
    it "True" do
      complain = build(:complain)
      expect(complain).to be_valid
    end
    it "False (title empty)" do
      complain = build(:complain, title: '')
      expect(complain).to_not be_valid
    end
    it "False (description empty)" do
      complain = build(:complain, description: '')
      expect(complain).to_not be_valid
    end
    it "False (city empty)" do
      complain = build(:complain, city: '')
      expect(complain).to_not be_valid
    end
    it "False (state state)" do
      complain = build(:complain, state: '')
      expect(complain).to_not be_valid
    end
    it "False (country empty)" do
      complain = build(:complain, country: '')
      expect(complain).to_not be_valid
    end
    it "False (company empty)" do
      complain = build(:complain, company: '')
      expect(complain).to_not be_valid
    end
  end

end
