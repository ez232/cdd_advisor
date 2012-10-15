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
  validates :product_weight, presence: true, 
    numericality: { :greater_than => 0 }
  # FIXME: check why this is not working
  validates :project, associated: true

  MANUFACTURING_VALUES = [ 'Molding', 'Casting', 'Bulk Forming',
                           'Sheet Forming', 'Lay-up Methods', 'Powder Methods', 
                           'Joining Methods' ]

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
      @results = generate_results
    else
      @results
    end
  end
  
  private
    def generate_results
      # Create a hash map to store the results.
      # Example:
      #
      # dexterity
      #    percentual: X.XX
      #        message1
      #        message2
      #        message3
      results = {  dexterity: { percentual: 0.0, messages: [] },
                  visibility: { percentual: 0.0, messages: [] },
                    strength: { percentual: 0.0, messages: [] } }

      # 1) Evaluating dexterity rules
      values = results[:dexterity]
      # 1.1) Rules on handle
      #
      # Checks if the proposal has a handle.
      unless handle.nil?
        # TODO: check parallel or serial rules with Emilene
        if handle.power_grip or handle.cylindrical_grip or handle.hook_grip
          if product_weight <= 400
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying or handle.holding
                update_values values, 0.46, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 0.83, 'Message'
              elsif handle.holding
                update_values values, 0.62, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 0.95, 'Message'
              elsif handle.holding
                update_values values, 0.73, 'Message'
              end # else ???
            end
          elsif product_weight < 2000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 1.80, 'Message'
              elsif handle.holding
                update_values values, 1.60, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 2.30, 'Message'
              elsif handle.holding
                update_values values, 1.80, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 2.70, 'Message'
              elsif handle.holding
                update_values values, 2.30, 'Message'
              end # else ???
            end
          elsif product_weight >= 2000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 3.50, 'Message'
              elsif handle.holding
                update_values values, 3.40, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 3.80, 'Message'
              elsif handle.holding
                update_values values, 3.60, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 4.20, 'Message'
              elsif handle.holding
                update_values values, 3.98, 'Message'
              end # else ???
            end
          end
        end # else???

        if handle.spherical_grip or handle.disc_grip or handle.disc_grip_2
          if product_weight <= 400
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying or handle.holding
                update_values values, 0.46, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 0.83, 'Message'
              elsif handle.holding
                update_values values, 0.62, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 0.95, 'Message'
              elsif handle.holding
                update_values values, 0.73, 'Message'
              end # else ???
            end
          elsif product_weight < 1000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 1.80, 'Message'
              elsif handle.holding
                update_values values, 1.60, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 2.30, 'Message'
              elsif handle.holding
                update_values values, 1.80, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 2.70, 'Message'
              elsif handle.holding
                update_values values, 2.30, 'Message'
              end # else ???
            end
          elsif product_weight >= 1000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 3.50, 'Message'
              elsif handle.holding
                update_values values, 3.40, 'Message'
              end # else???
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 3.80, 'Message'
              elsif handle.holding
                update_values values, 3.60, 'Message'
              end # else ???
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 4.20, 'Message'
              elsif handle.holding
                update_values values, 3.98, 'Message'
              end # else ???
            end
          end
        end # else ???

        if handle.pinch_grip or handle.pinch_grip_2
          if product_weight <= 100
            update_values values, 2.60, 
              'Change your handle to allow other type of grip rather than pinch grip.'
          elsif product_weight < 500
            update_values values, 2.60, 
              [ 
                'Change your handle to allow other type of grip rather than pinch grip.',
                'Change the product weight for less than 100gr.'
              ]
          elsif product_weight >= 500
            update_values values, 2.60, 
              [ 
                'Change your handle to allow other type of grip rather than pinch grip.',
                'Change the product weight for less than 500gr.'
              ]
          end            
        end # else ???
      end

      logger.debug results
      results
    end

    def update_values(values, percentual, message)
      # Updates the percentual value if the new value is greater than the old
      # one.
      if percentual > values[:percentual]
        values[:percentual] = percentual
      end

      # Adds a message to the array of messages.
      if message.is_a? Array
        values[:messages].concat message
      else
        values[:messages] << message
      end

      # Returns the updated value.
      return values
    end
end
