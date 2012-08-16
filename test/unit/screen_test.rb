require 'test_helper'

class ScreenTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "screen should be valid" do
    @proposal.screen = screens(:one)

    assert @proposal.screen.valid?
    assert_equal 0, @proposal.screen.errors.size
  end

  test "screen should not be valid" do
    screen = screens(:one)

    assert screen.invalid?
    assert_equal "is not a valid proposal", 
      screen.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a screen" do
    @proposal.screen = screens(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Screen.find(screens(:one))
    end
  end
end
