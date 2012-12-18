class Switch < ActiveRecord::Base

  attr_accessible :background_colour, :colour, :disc_grip, :disc_grip_2,
    :flat_hand_push, :force_required, :height, :length_or_external_diameter,
    :name, :one_finger_press, :pinch_grip, :pinch_grip_2, :pressing,
    :proposal_id, :pulling, :pushing, :shape, :sliding, :span_grip,
    :spherical_grip, :thumb_press, :turning, :two_fingers_press, :width

  belongs_to :proposal, inverse_of: :switches

  validates :proposal, presence: { message: "is not a valid proposal" }
  validates :colour, :background_colour, :name,
    presence: { message: "can't be blank" }
  validates :colour, :background_colour,
    format: { with: ColorUtils::FORMAT }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle"]

  def recommendations
    proposal.recommendations_for(self) if proposal
  end
end
