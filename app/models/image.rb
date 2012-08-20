class Image < ActiveRecord::Base
  attr_accessible :name, :image, :proposal_id

  belongs_to :proposal, inverse_of: :images

  validates :proposal, presence: { message: "is not a valid proposal" }

  mount_uploader :image, ImageUploader
end
