require 'test_helper'

class TouchScreenTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "touch_screen should be valid" do
    @proposal.touch_screen = touch_screens(:one)

    assert @proposal.touch_screen.valid?
    assert_equal 0, @proposal.touch_screen.errors.size
  end

  test "touch_screen should not be valid" do
    touch_screen = touch_screens(:one)

    assert touch_screen.invalid?
    assert_equal "is not a valid proposal", 
      touch_screen.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a touch_screen" do
    @proposal.touch_screen = touch_screens(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      TouchScreen.find(touch_screens(:one))
    end
  end
end
