class Handle < ActiveRecord::Base
  attr_accessible :carrying, :cylindrical_grip, :disc_grip, :height, :holding,
    :hook_grip, :external_diameter, :moving, :pinch_grip, :power_grip, :name,
    :proposal_id, :shape, :spherical_grip, :width, :pinch_grip_2, :disc_grip_2

  belongs_to :proposal, inverse_of: :handles

  validates :proposal, presence: { message: "is not a valid proposal" }
  validates :external_diameter, presence: true,
    numericality: { :greater_than => 0 }
  validates :name, presence: { message: "can't be blank" }

  SHAPE_VALUES = [ "Organic", "Rectangle", "Square", "Trapezium", "Trapezoid",
    "Cylindrical", "Oval", "Spherical", "Conical", "Triangle" ]

  def recommendations
    proposal.recommendations_for(self) if proposal
  end
end
