class MaterialValue < ActiveRecord::Base
  attr_accessible :category, :name

  has_and_belongs_to_many :proposals

  def materials
    MaterialValue.find_all_by_category(category)
  end

  def self.categories
    MaterialValue.select(:category).uniq.to_a
  end
end
