class Proposal < ActiveRecord::Base
  attr_accessible :name, :product_weight, :product_colour, :manufacturing,
    :key_components_mechanics, :key_components_electronics, 
    :key_components_fixing, :material, :finishing, :maintenance, 
    :handle_attributes, :switch_attributes, :knob_attributes, 
    :button_attributes, :screen_attributes, :touch_screen_attributes, 
    :label_attributes, :opening_device_attributes, :audio_device_attributes

  has_one :handle, dependent: :destroy, inverse_of: :proposal
  has_one :switch, dependent: :destroy, inverse_of: :proposal
  has_one :knob, dependent: :destroy, inverse_of: :proposal
  has_one :button, dependent: :destroy, inverse_of: :proposal
  has_one :screen, dependent: :destroy, inverse_of: :proposal
  has_one :touch_screen, dependent: :destroy, inverse_of: :proposal
  has_one :label, dependent: :destroy, inverse_of: :proposal
  has_one :opening_device, dependent: :destroy, inverse_of: :proposal
  has_one :audio_device, dependent: :destroy, inverse_of: :proposal

  belongs_to :project

  accepts_nested_attributes_for :handle, :switch, :knob, :button, :screen,
    :touch_screen, :label, :opening_device, :audio_device

  # TODO: review attribute validation
  validates :name, presence: true, uniqueness: { scope: :project_id }
  validates :project_id, presence: { message: 'is not a valid project' }
  # FIXME: check why this is not working
  validates :project, associated: true

  MANUFACTURING_VALUES = [ 'Molding', 'Casting', 'Bulk Forming', 
    'Sheet Forming', 'Lay-up Methods', 'Powder Methods', 'Joining Methods' ]

  FINISHING_VALUES = [ 'Printing', 'Plating', 'Polishing', 'Coating', 'Etching', 
    'Texturing' ]

  MAINTENANCE_VALUES = [ 'Changing Parts', 'Cleaning', 'Fixing' ]

  MATERIAL_VALUES = { 
    'Natural' => 
      [ 'Bamboo', 'Balsa', 'Cork', 'Leather', 'Wood' ],
    'Ceramic & Glasses' =>
      [ 'Soda-lime Glass', 'Silica Glass', 'Barosilicate', 'Glass Ceramic', 
        'Alumina', 'Silicon Carbide' ],
    'Polymer' =>
      [ 'Polyethylene - PE', 'Polypropylene - PP', 'Polystyrene - PS', 'ABS', 
        'Polyamide - PA, Nylon', 'Polymethylmethathacrylate - PMMA', 'Acrylic', 
        'Polycarbonate - PC', 'Acetal', 'Ionometers', 'Celluloses', 'PEEK', 
        'PVC', 'PU', 'Silicones', 'Polyesters - PET, PBT', 'Epoxy', 'Phenolic', 
        'Elastomers', 'Polymer Foams ', 'Polymer composites' ],
    'Metal' =>
      [ 'Carbon Steels', 'Stainless Steels', 'Low Alloy Steels', 
        'Aluminium Alloy', 'Magnesium Alloy', 'Cooper Alloy - Brass / Bronze', 
        'Titanium Alloy', 'Nickel Alloy', 'Zinc Alloy' ],
    'Fibers' =>
      [ 'Glass Fibers', 'Carbon Fibers', 'Aramid Fibers', 'Hemp', 
        'Silicon Carbide Fibers' ]
  }
end