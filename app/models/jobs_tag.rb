class JobsTag < ActiveRecord::Base
  validates :job_id, presence: true
  validates :tag_id, presence: true

  belongs_to :job
  belongs_to :tag
end