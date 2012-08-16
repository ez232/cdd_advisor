class Label < ActiveRecord::Base
  attr_accessible :digital, :font_type, :labels_reading_distance, :printed, 
    :proposal_id, :text_colour, :text_size

  belongs_to :proposal, inverse_of: :label

  validates :proposal, presence: { message: "is not a valid proposal" }
end
