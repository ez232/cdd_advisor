class Proposal < ActiveRecord::Base
  attr_accessible :name, :handle_shape_id, :switch_shape_id, :knob_shape_id,
    :button_shape_id, :scrollbar_shape_id

  validates :name, presence: true, uniqueness: true
  validates :project_id, presence: { message: "is not a valid project" }

  belongs_to :project
  belongs_to :handle_shape, class_name: "Shape"
  belongs_to :switch_shape, class_name: "Shape"
  belongs_to :knob_shape, class_name: "Shape"
  belongs_to :button_shape, class_name: "Shape"
  belongs_to :scrollbar_shape, class_name: "Shape"
end
