class Button < ActiveRecord::Base
  attr_accessible :background_colour, :colour, :force_required, :height,
    :length_or_external_diameter, :one_finger_press, :pressing, :proposal_id, :pulling,
    :pushing, :shape, :sliding, :thumb_press, :turning, :two_fingers_press,
    :width, :name

  belongs_to :proposal, inverse_of: :buttons

  validates :proposal, presence: { message: "is not a valid proposal" }

  validates :name, presence: { message: "can't be blank" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ]

  def recommendations
    proposal.recommendations_for(self) if proposal
  end
end
