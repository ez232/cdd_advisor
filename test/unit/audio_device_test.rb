require 'test_helper'

class AudioDeviceTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "audio_device should be valid" do
    @proposal.audio_device = audio_devices(:one)

    assert @proposal.audio_device.valid?
    assert_equal 0, @proposal.audio_device.errors.size
  end

  test "audio_device should not be valid" do
    audio_device = audio_devices(:one)

    assert audio_device.invalid?
    assert_equal "is not a valid proposal", 
      audio_device.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a audio_device" do
    @proposal.audio_device = audio_devices(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      AudioDevice.find(audio_devices(:one))
    end
  end
end
