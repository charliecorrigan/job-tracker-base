require 'rails_helper'

RSpec.describe Tag do
  describe "Validations" do
    it "is invalid without a name" do
      tag = Tag.new(name: nil)
      expect(tag).to be_invalid
    end
  end

  describe "Relationships" do
    it "has many jobs_tags" do
      tag = Tag.new(name: "good-location")
      expect(tag).to respond_to(:jobs)
    end

    it "has many jobs_tags" do
      tag = Tag.new(name: "good-location")
      expect(tag).to respond_to(:jobs_tags)
    end
  end
end
