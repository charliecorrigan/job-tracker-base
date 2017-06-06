require 'rails_helper'

RSpec.describe JobsTag do
  describe "Validations" do
    it "is invalid without a job_id" do
      jobs_tag = JobsTag.new(tag_id: 1)
      expect(jobs_tag).to be_invalid
    end

    it "is invalid without a tag_id" do
      jobs_tag = JobsTag.new(job_id: 1)
      expect(jobs_tag).to be_invalid
    end
  end

  describe "Relationships" do
    it "belongs to a job" do
      jobs_tag = JobsTag.new(job_id: 1, tag_id: 1)
      expect(jobs_tag).to respond_to(:job)
    end

    it "belongs to a tag" do
      jobs_tag = JobsTag.new(job_id: 1, tag_id: 1)
      expect(jobs_tag).to respond_to(:tag)
    end
  end
end
