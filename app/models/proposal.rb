class Proposal < ActiveRecord::Base
  attr_accessible :name, :handle_attributes

  has_one :handle, dependent: :destroy, inverse_of: :proposal

  belongs_to :project

  accepts_nested_attributes_for :handle

  validates :name, presence: true, uniqueness: { scope: :project_id }
  validates :project_id, presence: { message: "is not a valid project" }
  # FIXME: check why this is not working
  validates :project, associated: true
end
