require 'rails_helper'

describe "User sees job count for tags associated with a job" do
  scenario "a user sees a count of all jobs for each tag" do
    company = Company.create!(name: "ESPN")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Custodian", level_of_interest: 50, city: "Denver")
    job3 = company.jobs.create!(title: "Designer", level_of_interest: 60, city: "Denver")
    job4 = company.jobs.create!(title: "Boss Guy", level_of_interest: 2, city: "Denver")

    tag1 = Tag.create(name: "Software")
    tag2 = Tag.create(name: "Good-Location")
    jobs_tags1 = JobsTag.create(job_id: job1.id, tag_id: tag1.id)
    jobs_tags2 = JobsTag.create(job_id: job1.id, tag_id: tag2.id)
    jobs_tags3 = JobsTag.create(job_id: job2.id, tag_id: tag2.id)
    jobs_tags4 = JobsTag.create(job_id: job3.id, tag_id: tag2.id)
    jobs_tags5 = JobsTag.create(job_id: job4.id, tag_id: tag2.id)
    jobs_tags6 = JobsTag.create(job_id: job3.id, tag_id: tag1.id)

    visit company_job_path(company, job1)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Software - 2")
    expect(page).to have_content("Good-Location - 4")
  end
end