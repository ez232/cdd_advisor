require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  fixtures :all

  def setup
    @project = projects(:iPhone)
    @proposal = proposals(:one)
    @project.proposals << @proposal
  end

  test "label should be valid" do
    @proposal.label = labels(:one)

    assert @proposal.label.valid?
    assert_equal 0, @proposal.label.errors.size
  end

  test "label should not be valid" do
    label = labels(:one)

    assert label.invalid?
    assert_equal "is not a valid proposal", 
      label.errors[:proposal].join('; ')    
  end

  test "destroying a proposal should destroy a label" do
    @proposal.label = labels(:one)
    @proposal.destroy

    assert_raise ActiveRecord::RecordNotFound do
      Label.find(labels(:one))
    end
  end
end
