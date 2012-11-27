class Label < ActiveRecord::Base
  attr_accessible :digital, :font_type, :labels_reading_distance, :printed,
    :proposal_id, :text_colour, :text_size, :background_colour

  belongs_to :proposal, inverse_of: :label

  validates :proposal, presence: { message: "is not a valid proposal" }
  validates :text_colour, :background_colour,
    presence: { message: "can't be blank" }
  validates :text_size, presence: true,
    numericality: { :greater_than => 0 }
  validates :labels_reading_distance, presence: true,
    numericality: { :greater_than => 0 }
end
