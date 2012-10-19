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
                update_values values, 0.46,
                'This is the minimum exclusion for this type of handle'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 0.83,
                'Change the handle dimensions (length or diameter)
                to lesser than 30 mm to enhance inclusivity'
              elsif handle.holding
                update_values values, 0.62,
                'Change the handle dimensions (length or diameter)
                to lesser than 30 mm to enhance inclusivity'
              else
                update_values values, 0.83,
                'Change the handle dimensions (length or diameter)
                to lesser than 30 mm to enhance inclusivity'
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 0.95,
                'Change the handle dimensions (length or diameter)
                to lesser than 70 mm or 30 mm to enhance inclusivity'
              elsif handle.holding
                update_values values, 0.73,
                'Change the handle dimensions (length or diameter)
                to lesser than 70 mm or 30 mm to enhance inclusivity'
              else
                update_values values, 0.95,
                'Change the handle dimensions (length or diameter)
                to lesser than 70 mm or 30 mm to enhance inclusivity'
              end
            end
          elsif product_weight < 2000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 1.80,
                'Change the product weight to 400 gr or less'
              elsif handle.holding
                update_values values, 1.60,
                'Change the product weight to 400 gr or less'
              else
                update_values values, 1.80,
                'Change the product weight to 400gr or less'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 2.30,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30 mm
                  to enhance inclusivity '
                 ]
              elsif handle.holding
                update_values values, 1.80,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30 mm
                  to enhance inclusivity '
                 ]
              else
                update_values values, 2.30,
                [
                  'Change the product weight to 400gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm
                  to enhance inclusivity'
                ]
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 2.70,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70 mm or 30 mm
                  to enhance inclusivity '
                 ]
              elsif handle.holding
                update_values values, 2.30,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70 mm or 30 mm
                  to enhance inclusivity '
                 ]
              else
                update_values values, 2.70,
                [
                  'Change the product weight to 400gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm
                  to enhance inclusivity'
                ]
              end
            end
          elsif product_weight >= 2000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 3.50,
                'Change the product weight to lesser than 2Kg or less than
                400gr to enhance inclusivity'
              elsif handle.holding
                update_values values, 3.40,
                'Change the product weight to lesser than 2Kg or less than
                400gr to enhance inclusivity'
              else
                update_values values, 3.50,
                'Change the product weight to lesser than 2Kg or less than
                400gr to enhance inclusivity'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 3.80,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              elsif handle.holding
                update_values values, 3.60,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              else
                update_values values, 3.80,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 4.20,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              elsif handle.holding
                update_values values, 3.98,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              else
                update_values values, 4.20,
                [
                  'Change the product weight to less than 2Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              end
            end
          end
        end # else???

        if handle.spherical_grip or handle.disc_grip or handle.disc_grip_2
          if product_weight <= 400
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying or handle.holding
                update_values values, 0.46,
                'This is the minimum exclusion for this type of handle'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 0.83,
                'Change the handle dimensions (length or diameter)
                to lesser than 30 mm to enhance inclusivity'
              elsif handle.holding
                update_values values, 0.62,
                'Change the handle dimensions (length or diameter)
                to lesser than 30 mm to enhance inclusivity'
              else
                update_values values, 0.83,
                'Change the handle dimensions (length or diameter)
                to lesser than 30mm to enhance inclusivity'
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 0.95,
                'Change the handle dimensions (length or diameter)
                to lesser than 70 mm or 30 mm to enhance inclusivity'
              elsif handle.holding
                update_values values, 0.73,
                'Change the handle dimensions (length or diameter)
                to lesser than 70 mm or 30 mm to enhance inclusivity'
              else
                update_values values, 0.95,
                'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm
                to enhance inclusivity'
              end
            end
          elsif product_weight < 1000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values,  1.80,
                'Change the product weight to 400 gr or less'
              elsif handle.holding
                update_values values, 1.60,
                'Change the product weight to 400 gr or less'
              else
                update_values values, 2.70,
                 'Change the product weight to 400gr or less'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 2.30,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30 mm
                  to enhance inclusivity '
                 ]
              elsif handle.holding
                update_values values, 1.80,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30 mm
                  to enhance inclusivity '
                 ]
              else
                update_values values, 2.30,
                [
                  'Change the product weight to 400gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm
                  to enhance inclusivity'
                ]
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 2.70,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70 mm or 30 mm
                  to enhance inclusivity '
                 ]
              elsif handle.holding
                update_values values, 2.30,
                [
                  'Change the product weight to 400 gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70 mm or 30 mm
                  to enhance inclusivity '
                 ]
              else
                update_values values, 2.70,
                [
                  'Change the product weight to 400gr or less',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm
                  to enhance inclusivity'
                ]
              end
            end
          elsif product_weight >= 1000
            if handle.length_or_radius <= 30
              if handle.moving or handle.carrying
                update_values values, 3.50,
                'Change the product weight to lesser than 1Kg or less than
                400gr to enhance inclusivity'
              elsif handle.holding
                update_values values, 3.40,
                'Change the product weight to lesser than 1Kg or less than
                400gr to enhance inclusivity'
              else
                update_values values, 3.50,
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity'
              end
            elsif handle.length_or_radius <= 70
              if handle.moving or handle.carrying
                update_values values, 3.80,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              elsif handle.holding
                update_values values, 3.60,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              else
                update_values values, 3.80,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 30mm'
                ]
              end
            elsif handle.length_or_radius > 70
              if handle.moving or handle.carrying
                update_values values, 4.20,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              elsif handle.holding
                update_values values, 3.98,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              else
                update_values values, 4.20,
                [
                  'Change the product weight to less than 1Kg or lesser than 400gr to enhance inclusivity',
                  'Change the handle dimensions (length or diameter) to lesser than 70mm or 30mm'
                ]
              end
            end
          end
        end # else ???

        if handle.pinch_grip or handle.pinch_grip_2
          if product_weight <= 100
            update_values values, 2.60,
              'Change your handle to allow other type of grip rather than pinch grip.'
          elsif product_weight < 500
            update_values values, 4.80,
              [
                'Change your handle to allow other type of grip rather than pinch grip.',
                'Change the product weight for less than 100gr.'
              ]
          elsif product_weight >= 500
            update_values values, 6.00,
              [
                'Change your handle to allow other type of grip rather than pinch grip.',
                'Change the product weight for less than 500gr.'
              ]
          end
        end # else ???
      end

      values = results[:visibility]
      # 1.1) Rules on Label
      #
      # Checks if the proposal has a label.
      unless label.nil?
        # TODO: check parallel or serial rules with Emilene
        if label.text_colour
          if product_colour == label.text_colour
          update_values values, 5.35,
              [
                'Increase background-foreground colour contrast (product colour-text colour)',
                '100% black in 100% white is the best foreground-background contrast',
                'Avoid red in green or green in red colour contrast (to not excluded red-green colour blind people)'
              ]
          else
            if label.text_size < 12
              if label.labels_reading_distance > 500
              update_values values, 4.35,
              [
               'Increase text size',
               'Increase background-foreground colour contrast (product colour-text colour)',
               'Reduce reading distance'
              ]
              else
              update_values values, 3.35,
              [
               'Increase text size',
               'Increase background-foreground colour contrast (product colour-text colour)'
              ]
              end
            elsif label.text_size < 14
              if label.labels_reading_distance > 500
              update_values values, 2.30,
              [
               'Increase text size',
               'Increase background-foreground colour contrast (product colour-text colour)',
               'Reduce reading distance'
              ]
              else
              update_values values, 1.50,
              [
               'Increase text size',
               'Increase background-foreground colour contrast (product colour-text colour)'
              ]
              end
            elsif label.text_size >= 14
              if label.labels_reading_distance > 500
              update_values values, 1.30,
              [
                'Reduce reading distance',
                'Increase background-foreground colour contrast (product colour-text colour)'
              ]
              else
              update_values values, 0.70,
                'Increase background-foreground colour contrast (product colour-text colour)'
              end
            else
            update_values values, 4.35,
            [
              'Increase text size',
              'Increase background-foreground colour contrast (product colour-text colour)',
              'Reduce reading distance'
            ]
            end
          end
        end # else???
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
