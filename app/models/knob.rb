class Knob < ActiveRecord::Base
  attr_accessible :background_colour, :colour, :cylindrical_grip, :disc_grip,
    :force_required, :height, :length_or_radius, :one_finger_press, :pinch_grip,
    :pressing, :proposal_id, :pulling, :pushing, :shape, :sliding, :span_grip,
    :spherical_grip, :thumb_press, :turning, :two_fingers_press, :width

  belongs_to :proposal, inverse_of: :knob

  validates :proposal, presence: { message: "is not a valid proposal" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ] 
end
