class Handle < ActiveRecord::Base
  attr_accessible :carrying, :cylindrical_grip, :disc_grip, :flat_hand_push, 
    :height, :holding, :hook_grip, :length_or_radius, :moving, :pinch_grip, 
    :power_grip, :proposal_id, :shape, :span_grip, :spherical_grip, :width

  belongs_to :proposal, inverse_of: :handle

  validates :proposal, presence: { message: "is not a valid proposal" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ]
end
