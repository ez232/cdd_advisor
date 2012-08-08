require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  fixtures :projects

  test "project name must not be empty" do
    project = Project.new
    
    assert project.invalid?
    assert project.errors[:name].any?
    
    # All other attributes are optional.
    assert !project.errors[:target_market].any?
    assert !project.errors[:timescale].any?
    assert !project.errors[:volume_of_sale].any?
    assert !project.errors[:volume_of_sale].any?
  end

  test "project is not valid without a unique name" do
    project = Project.new(name: projects(:iPhone).name, 
                          target_market: "xxx",
                          timescale: "yyy", 
                          volume_of_sale: 10, 
                          final_price: 1.5)

    assert !project.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'), 
                 project.errors[:name].join('; ')
  end

  test "volume of sale (if present) should be greater than or equal to 1" do
    project = Project.new(name: "xxx", 
                          target_market: "yyy",
                          timescale: "zzz", 
                          final_price: 1.5)

    error_msg = 'errors.messages.greater_than_or_equal_to'

    project.volume_of_sale = -1
    assert project.invalid?
    assert_equal I18n.translate(error_msg, count: 1),
                 project.errors[:volume_of_sale].join('; ')

    project.volume_of_sale = 0
    assert project.invalid?
    assert_equal I18n.translate(error_msg, count: 1),
                 project.errors[:volume_of_sale].join('; ')

    project.volume_of_sale = 1
    assert project.valid?
  end

  test "final price (if present) should be greater than or equal to 0.01" do
    project = Project.new(name: "xxx", 
                          target_market: "yyy",
                          timescale: "zzz", 
                          volume_of_sale: 1)

    error_msg = 'errors.messages.greater_than_or_equal_to'

    project.final_price = -1
    assert project.invalid?
    assert_equal I18n.translate(error_msg, count: 0.01),
                 project.errors[:final_price].join('; ')

    project.final_price = 0
    assert project.invalid?
    assert_equal I18n.translate(error_msg, count: 0.01),
                 project.errors[:final_price].join('; ')

    project.final_price = 1
    assert project.valid?
  end

  test "maximum target flag behaviour" do
    project = Project.new(name: "xxx", 
                          timescale: "yyy",
                          volume_of_sale: 1, 
                          final_price: 1.5)
    
    assert project.valid?

    project.target_market = nil
    assert project.maximum_target?

    project.target_market = ""
    assert project.maximum_target?

    project.target_market = "zzz"
    assert !project.maximum_target?
  end
end