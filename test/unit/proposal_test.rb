require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  fixtures :projects
  fixtures :proposals

  test "proposal name must no be empty" do
    proposal = Proposal.new
    proposal.project_id = projects(:iPhone).id

    assert proposal.invalid?
    assert proposal.errors[:name].any?
  end

  test "proposal is not valid without a unique name inside project" do
    proposal = Proposal.new(name: proposals(:one).name)
    proposal.project_id = projects(:iPhone).id

    assert proposal.save

    proposal = Proposal.new(name: proposals(:one).name)
    proposal.project_id = projects(:iPhone).id

    assert !proposal.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), 
                 proposal.errors[:name].join('; ')

    proposal = Proposal.new(name: proposals(:one).name)
    proposal.project_id = projects(:GalaxySIII).id

    assert proposal.valid?
    assert !proposal.errors[:name].any?
    assert !proposal.errors[:project_id].any?
  end

  test "proposal must have a project associated" do
    proposal = proposals(:one)

    assert proposal.invalid?
    assert proposal.errors[:project_id]
    assert_equal "is not a valid project",
                 proposal.errors[:project_id].join('; ')
  end

  test "proposal should be valid" do
    proposal = proposals(:one)
    proposal.project_id = projects(:iPhone).id

    assert proposal.valid?
    assert !proposal.errors[:name].any?
    assert !proposal.errors[:project_id].any?
  end
end
