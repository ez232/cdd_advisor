require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "image should be valid" do
    @proposal.images << images(:one)

    assert @proposal.images[0].valid?
    assert_equal 0, @proposal.images[0].errors.size
  end

  test "image should not be valid" do
    image = images(:one)

    assert image.invalid?
    assert_equal "is not a valid proposal", 
      image.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a image" do
    @proposal.images << images(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Image.find(images(:one))
    end
  end
end
