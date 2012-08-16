require 'test_helper'

class SwitchTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "switch should be valid" do
    @proposal.switch = switches(:one)

    assert @proposal.switch.valid?
    assert_equal 0, @proposal.switch.errors.size
  end

  test "switch should not be valid" do
    switch = switches(:one)

    assert switch.invalid?
    assert_equal "is not a valid proposal", 
      switch.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a switch" do
    @proposal.switch = switches(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Switch.find(switches(:one))
    end
  end
end
