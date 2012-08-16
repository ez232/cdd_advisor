class Screen < ActiveRecord::Base
  attr_accessible :has_screen, :proposal_id

  belongs_to :proposal, inverse_of: :screen

  validates :proposal, presence: { message: "is not a valid proposal" }
end
