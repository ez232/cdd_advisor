class Upload < ActiveRecord::Base
  attr_accessible :upload

  has_attached_file :upload

  belongs_to :proposal, inverse_of: :images

  # validates :proposal, presence: { message: "is not a valid proposal" }

  include Rails.application.routes.url_helpers

  def name
    File.basename(upload_file_name, '.*').titleize if upload_file_name
  end

  def to_jq_upload
    {
      'name' => read_attribute(:upload_file_name),
      'size' => read_attribute(:upload_file_size),
      'url' => upload.url(:original),
      'thumbnail_url' => upload.url(:original),
      'delete_url' => project_proposal_upload_path(self.proposal.project,
                                                   self.proposal, self),
      'delete_type' => 'DELETE'
    }
  end
end
