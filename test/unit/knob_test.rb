require 'test_helper'

class KnobTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "knob should be valid" do
    @proposal.knob = knobs(:one)

    assert @proposal.knob.valid?
    assert_equal 0, @proposal.knob.errors.size
  end

  test "knob should not be valid" do
    knob = knobs(:one)

    assert knob.invalid?
    assert_equal "is not a valid proposal", 
      knob.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a knob" do
    @proposal.knob = knobs(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Knob.find(knobs(:one))
    end
  end
end
