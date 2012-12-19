class Knob < ActiveRecord::Base
  attr_accessible :disc_grip_2, :force_required, :height,
    :length_or_external_diameter, :name, :one_finger_press, :pinch_grip,
    :pinch_grip_2, :pressing, :proposal_id, :pulling, :pushing, :shape,
    :sliding, :span_grip, :spherical_grip, :thumb_press, :turning,
    :two_fingers_press, :width, :background_colour, :colour, :cylindrical_grip,
    :disc_grip

  belongs_to :proposal, inverse_of: :knobs

  validates :proposal, presence: { message: "is not a valid proposal" }
  validates :colour, :background_colour, :name,
    presence: { message: "can't be blank" }
  validates :colour, :background_colour,
    format: { with: ColorUtils::FORMAT }

  SHAPE_VALUES = [ "Organic", "Cylindrical", "Oval", "Spherical", "Conical",
    "Rectangle", "Square", "Trapezium", "Trapezoid", "Triangle"]

  def recommendations
    proposal.recommendations_for(self) if proposal
  end
end
