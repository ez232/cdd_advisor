require 'test_helper'

class ButtonTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "button should be valid" do
    @proposal.button = buttons(:one)

    assert @proposal.button.valid?
    assert_equal 0, @proposal.button.errors.size
  end

  test "button should not be valid" do
    button = buttons(:one)

    assert button.invalid?
    assert_equal "is not a valid proposal", 
      button.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a button" do
    @proposal.button = buttons(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Button.find(buttons(:one))
    end
  end
end
