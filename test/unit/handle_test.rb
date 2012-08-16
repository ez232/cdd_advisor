require 'test_helper'

class HandleTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "handle should be valid" do
    @proposal.handle = handles(:one)

    assert @proposal.handle.valid?
    assert_equal 0, @proposal.handle.errors.size
  end

  test "handle should not be valid" do
    handle = handles(:one)

    assert handle.invalid?
    assert_equal "is not a valid proposal", 
      handle.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a handle" do
    @proposal.handle = handles(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Handle.find(handles(:one))
    end
  end
end
