require 'rails_helper'

describe "User sees tags associated with a job" do
  scenario "a user sees all tags for a specific job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    tag1 = Tag.create("Software")
    tag2 = Tag.create("Good-Location")
    jobs_tags1 = JobsTag.create(job_id: job.id, tag_id: tag1.id)
    jobs_tags2 = JobsTag.create(job_id: job.id, tag_id: tag2.id)

    visit company_job_path(company, job)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Software")
    expect(page).to have_content("Good-Location")
  end
end