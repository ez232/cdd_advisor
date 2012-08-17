class OpeningDevice < ActiveRecord::Base
  attr_accessible :is_opening_device, :proposal_id

  belongs_to :proposal, inverse_of: :opening_device

  validates :proposal, presence: { message: "is not a valid proposal" }
end
