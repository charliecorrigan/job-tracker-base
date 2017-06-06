class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :jobs_tags, dependent: :destroy
  has_many :jobs, through: :jobs_tags
end