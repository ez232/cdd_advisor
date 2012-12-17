class Project < ActiveRecord::Base
  attr_accessible :final_price, :name, :target_market, :timescale,
    :volume_of_sale, :maximum_target

  validates :name, presence: true, uniqueness: true
  validates :volume_of_sale, numericality: { greater_than_or_equal_to: 1 },
    allow_blank: true
  validates :final_price, numericality: { greater_than_or_equal_to: 0.01 },
    allow_blank: true

  has_many :proposals, dependent: :destroy

  def recommendations
    Hash.new({})
  end
end
