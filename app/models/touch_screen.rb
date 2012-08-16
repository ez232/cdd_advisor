class TouchScreen < ActiveRecord::Base
  attr_accessible :button_height, :button_length_or_radius, :button_shape, 
    :button_width, :proposal_id, :scroll_bar_height, 
    :scroll_bar_length_or_radius, :scroll_bar_shape, :scroll_bar_width

  belongs_to :proposal, inverse_of: :touch_screen

  validates :proposal, presence: { message: "is not a valid proposal" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ]
end
