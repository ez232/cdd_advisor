class AudioDevice < ActiveRecord::Base
  attr_accessible :proposal_id, :range_of_volume_specifications, 
    :sound_volume_specifications

  belongs_to :proposal, inverse_of: :audio_device

  validates :proposal, presence: { message: "is not a valid proposal" }
end
