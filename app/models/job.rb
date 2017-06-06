class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  has_many :jobs_tags
  has_many :tags, through: :jobs_tags

  def list_of_tags
    message = ""
    self.tags.each do |tag|
      message += "#{tag.name} - #{tag.jobs.count}, "
    end
    message[0..-3]
  end
end
