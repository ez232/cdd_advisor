require 'test_helper'

class OpeningDeviceTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "opening_device should be valid" do
    @proposal.opening_device = opening_devices(:one)

    assert @proposal.opening_device.valid?
    assert_equal 0, @proposal.opening_device.errors.size
  end

  test "opening_device should not be valid" do
    opening_device = opening_devices(:one)

    assert opening_device.invalid?
    assert_equal "is not a valid proposal", 
      opening_device.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a opening_device" do
    @proposal.opening_device = opening_devices(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      OpeningDevice.find(opening_devices(:one))
    end
  end
end
