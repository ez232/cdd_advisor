class Label < ActiveRecord::Base
  attr_accessible :digital, :font_type, :reading_distance, :printed,
    :proposal_id, :text_colour, :text_size, :background_colour, :name

  belongs_to :proposal, inverse_of: :labels

  validates :proposal, presence: { message: "is not a valid proposal" }
  validates :text_colour, :background_colour, :name,
    presence: { message: "can't be blank" }
  validates :text_size, :reading_distance, presence: true,
    numericality: { greater_than: 0 }
  validates :text_colour, :background_colour,
    format: { with: ColorUtils::FORMAT }

  def recommendations
    proposal.recommendations_for(self) if proposal
  end
end
