require 'rails_helper'

RSpec.describe Tag, type: model do
  describe "Validations" do
    it { should_validate_presence_of(:name) }
  end

  describe "Relationships" do
    it { should_have_many(:jobs) }
    it { should_have_many(:jobs_tags) }
  end
end
