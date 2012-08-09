class Proposal < ActiveRecord::Base
  attr_accessible :name

  validates :name, presence: true, uniqueness: true
  validates :project_id, presence: { message: "is not a valid project" }

  belongs_to :project
end
