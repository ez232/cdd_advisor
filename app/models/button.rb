class Button < ActiveRecord::Base
  attr_accessible :background_colour, :colour, :force_required, :height,
    :length_or_external_diameter, :one_finger_press, :pressing, :proposal_id, :pulling,
    :pushing, :shape, :sliding, :thumb_press, :turning, :two_fingers_press,
    :width

  belongs_to :proposal, inverse_of: :button

  validates :proposal, presence: { message: "is not a valid proposal" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ]
end
