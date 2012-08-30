class Proposal < ActiveRecord::Base
  attr_accessible :name, :product_weight, :product_colour, :manufacturing,
    :key_components_mechanics, :key_components_electronics, 
    :key_components_fixing, :material, :finishing, :maintenance, 
    :handle_attributes, :switch_attributes, :knob_attributes, 
    :button_attributes, :screen_attributes, :touch_screen_attributes, 
    :label_attributes, :opening_device_attributes, :audio_device_attributes,
    :images_attributes

  has_one :handle, dependent: :destroy, inverse_of: :proposal
  has_one :switch, dependent: :destroy, inverse_of: :proposal
  has_one :knob, dependent: :destroy, inverse_of: :proposal
  has_one :button, dependent: :destroy, inverse_of: :proposal
  has_one :screen, dependent: :destroy, inverse_of: :proposal
  has_one :touch_screen, dependent: :destroy, inverse_of: :proposal
  has_one :label, dependent: :destroy, inverse_of: :proposal
  has_one :opening_device, dependent: :destroy, inverse_of: :proposal
  has_one :audio_device, dependent: :destroy, inverse_of: :proposal
  has_many :images, dependent: :destroy, inverse_of: :proposal

  belongs_to :project

  accepts_nested_attributes_for :handle, :switch, :knob, :button, :screen,
    :touch_screen, :label, :opening_device, :audio_device, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true, 
    reject_if: :all_blank

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

  def results
    if @results.nil?
      generate_results
    else
      @results
    end
  end

  private
    def generate_results
      results = {}

      unless label.nil?
        results[label] = 
          if label.text_colour.casecmp(product_colour) == 0 # equal colours
            { percentual: 7.8, recommendation: "Label text colour and product colour should not be equal. Both are #{product_colour}." }
          elsif label.text_size < 12
            { percentual: 3.5, recommendation: "Label text size should be greater or equal to 12pt (actual value: #{label.text_size}pt)." }
          elsif label.text_colour.casecmp(product_colour) != 0 and # different colours
                label.text_size > 12 and
                label.labels_reading_distance < 300
            { percentual: 2.3, recommendation: "Write some recommendation here..." }
          end
      end

      unless handle.nil?
        results[handle] =
          if handle.holding and 
             handle.length_or_radius > 50 and 
             handle.width > 50 and 
             product_weight > 5 and
             handle.pinch_grip
            { percentual: 11.0, recommendation: "Write some recommendation here..." }
        end
      end


      unless switch.nil?
        results[switch] =
          if switch.shape != Switch::SHAPE_VALUES[0] and # different from 'Organic'
             switch.length_or_radius > 40 and 
             switch.width > 40 and
             switch.force_required > 10 and
             switch.pinch_grip
            { percentual: 4.1, recommendation: "Write some recommendation here..." }
          end
      end

      results
    end
end