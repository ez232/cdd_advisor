class Proposal < ActiveRecord::Base
  attr_accessible :name, :handle_attributes, :switch_attributes, 
    :knob_attributes, :button_attributes, :screen_attributes, 
    :touch_screen_attributes

  has_one :handle, dependent: :destroy, inverse_of: :proposal
  has_one :switch, dependent: :destroy, inverse_of: :proposal
  has_one :knob, dependent: :destroy, inverse_of: :proposal
  has_one :button, dependent: :destroy, inverse_of: :proposal
  has_one :screen, dependent: :destroy, inverse_of: :proposal
  has_one :touch_screen, dependent: :destroy, inverse_of: :proposal

  belongs_to :project

  accepts_nested_attributes_for :handle, :switch, :knob, :button, :screen,
    :touch_screen

  validates :name, presence: true, uniqueness: { scope: :project_id }
  validates :project_id, presence: { message: "is not a valid project" }
  # FIXME: check why this is not working
  validates :project, associated: true
end
