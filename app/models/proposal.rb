class Proposal < ActiveRecord::Base
  include Results
  include ColorUtils

  attr_accessible :name, :product_weight, :key_components_mechanics,
    :key_components_electronics, :key_components_fixing, :material_value_ids,
    :manufacturing_value_ids, :finishing_value_ids, :maintenance_value_ids,
    :target_market, :market_share, :market_response, :volume_of_sale,
    :final_price, :project_timescale, :sustainability, :social_responsibility,
    :impact_on_brand, :functionality, :aesthetics, :manufacturing, :components,
    :usability_accessibility, :materials, :finishing, :maintenance, :disposal

  has_many :handles, dependent: :destroy, inverse_of: :proposal
  has_many :switches, dependent: :destroy, inverse_of: :proposal
  has_many :knobs, dependent: :destroy, inverse_of: :proposal
  has_many :buttons, dependent: :destroy, inverse_of: :proposal
  has_many :labels, dependent: :destroy, inverse_of: :proposal
  has_many :images, class_name: 'Upload', dependent: :destroy,
    inverse_of: :proposal
  has_and_belongs_to_many :manufacturing_values
  has_and_belongs_to_many :finishing_values
  has_and_belongs_to_many :maintenance_values
  has_and_belongs_to_many :material_values

  belongs_to :project

  validates :name, presence: true, uniqueness: { scope: :project_id }
  validates :project_id, presence: { message: 'is not a valid project' }
  validates :product_weight, presence: true,
    numericality: { :greater_than => 0 }
  validates :project, associated: true

  def results
    generate_results_for :dexterity do
      for_each_item_in :handles do |handle|
        if handle.power_grip or handle.cylindrical_grip or handle.hook_grip
          if product_weight <= 400
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying or handle.holding
                with_percentual(0.46) do
                  recommend_handle_msg01
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(0.83) do
                  recommend_handle_msg02 handle
                end
              elsif handle.holding
                with_percentual(0.62) do
                  recommend_handle_msg02 handle
                end
              else
                with_percentual(0.83) do
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(0.95) do
                  recommend_handle_msg03 handle
                end
              elsif handle.holding
                with_percentual(0.73) do
                  recommend_handle_msg03 handle
                end
              else
                with_percentual(0.95) do
                  recommend_handle_msg03 handle
                end
              end
            end
          elsif product_weight < 2000
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying
                with_percentual(1.80) do
                  recommend_handle_msg04
                end
              elsif handle.holding
                with_percentual(1.60) do
                  recommend_handle_msg04
                end
              else
                with_percentual(1.80) do
                  recommend_handle_msg04
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                 end
              elsif handle.holding
                with_percentual(1.80) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                 end
              else
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(2.70) do
                  recommend_handle_msg04
                  recommend_handle_msg03(handle)
                end
              elsif handle.holding
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg03(handle)
                end
              else
                with_percentual(2.70) do
                  recommend_handle_msg04
                  recommend_handle_msg03 handle
                end
              end
            end
          elsif product_weight >= 2000
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying
                with_percentual(3.50) do
                  recommend_handle_msg05
                end
              elsif handle.holding
                with_percentual(3.40) do
                  recommend_handle_msg05
                end
              else
                with_percentual(3.50) do
                  recommend_handle_msg05
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(3.80) do
                  recommend_handle_msg05
                  recommend_handle_msg02 handle
                end
              elsif handle.holding
                with_percentual(3.60) do
                  recommend_handle_msg05
                  recommend_handle_msg02 handle
                end
              else
                with_percentual(3.80) do
                  recommend_handle_msg05
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(4.20) do
                  recommend_handle_msg05
                  recommend_handle_msg03 handle
                end
              elsif handle.holding
                with_percentual(3.98) do
                  recommend_handle_msg05
                  recommend_handle_msg03 handle
                end
              else
                with_percentual(4.20) do
                  recommend_handle_msg05
                  recommend_handle_msg03 handle
                end
              end
            end
          end
        end

        if handle.spherical_grip or handle.disc_grip or handle.disc_grip_2
          if product_weight <= 400
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying or handle.holding
                with_percentual(0.46) do
                  recommend_handle_msg01
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(0.83) do
                  recommend_handle_msg02 handle
                end
              elsif handle.holding
                with_percentual(0.62) do
                  recommend_handle_msg02 handle
                end
              else
                with_percentual(0.83) do
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(0.95) do
                  recommend_handle_msg03 handle
                end
              elsif handle.holding
                with_percentual(0.73) do
                  recommend_handle_msg03 handle
                end
              else
                with_percentual(0.95) do
                  recommend_handle_msg03 handle
                end
              end
            end
          elsif product_weight < 1000
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying
                with_percentual(1.80) do
                  recommend_handle_msg04
                end
              elsif handle.holding
                with_percentual(1.60) do
                  recommend_handle_msg04
                end
              else
                with_percentual(2.70) do
                  recommend_handle_msg04
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                end
              elsif handle.holding
                with_percentual(1.80) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                end
              else
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(2.70) do
                  recommend_handle_msg04
                  recommend_handle_msg03 handle
                end
              elsif handle.holding
                with_percentual(2.30) do
                  recommend_handle_msg04
                  recommend_handle_msg03 handle
                end
              else
                with_percentual(2.70) do
                  recommend_handle_msg04
                  recommend_handle_msg03 handle
                end
              end
            end
          elsif product_weight >= 1000
            if handle.external_diameter <= 30
              if handle.moving or handle.carrying
                with_percentual(3.50) do
                  recommend_handle_msg06
                end
              elsif handle.holding
                with_percentual(3.40) do
                  recommend_handle_msg06
                end
              else
                with_percentual(3.50) do
                  recommend_handle_msg06
                end
              end
            elsif handle.external_diameter <= 70
              if handle.moving or handle.carrying
                with_percentual(3.80) do
                  recommend_handle_msg06
                  recommend_handle_msg02 handle
                end
              elsif handle.holding
                with_percentual(3.60) do
                  recommend_handle_msg06
                  recommend_handle_msg02 handle
                end
              else
                with_percentual(3.80) do
                  recommend_handle_msg06
                  recommend_handle_msg02 handle
                end
              end
            elsif handle.external_diameter > 70
              if handle.moving or handle.carrying
                with_percentual(4.20) do
                  recommend_handle_msg06
                  recommend_handle_msg03 handle
                end
              elsif handle.holding
                with_percentual(3.98) do
                  recommend_handle_msg06
                  recommend_handle_msg03 handle
                end
              else
                with_percentual(4.20) do
                  recommend_handle_msg06
                  recommend_handle_msg03 handle
                end
              end
            end
          end
        end

        if handle.pinch_grip or handle.pinch_grip_2
          if product_weight <= 100
            with_percentual(2.60) do
              recommend_handle_msg07 handle
            end
          elsif product_weight < 500
            with_percentual(4.80) do
              recommend_handle_msg07 handle
              recommend_handle_msg08
            end
          elsif product_weight >= 500
            with_percentual(6.00) do
              recommend_handle_msg07 handle
              recommend_handle_msg09
            end
          end
        end
      end

      for_each_item_in :buttons do |button|
        if button.two_fingers_press
          if button.length_or_external_diameter < 20
            with_percentual(6.00) do
              recommend_button_msg04 button
            end
          elsif button.force_required >= 23
            with_percentual(4.80) do
              recommend_button_msg05 button
            end
          elsif button.force_required < 23
            with_percentual(1.50) do
              recommend_button_msg06 button
            end
          end
        elsif button.one_finger_press
          if button.length_or_external_diameter < 13
            with_percentual(6.00) do
              recommend_button_msg04 button
            end
          elsif button.length_or_external_diameter >= 13
            if button.force_required >= 15
              with_percentual(4.80) do
                recommend_button_msg07 button
              end
            else
              with_percentual(1.60) do
                recommend_button_msg08 button
              end
            end
          end
        elsif button.thumb_press
          if button.length_or_external_diameter < 15
            with_percentual(6.00) do
              recommend_button_msg04 button
            end
          elsif button.length_or_external_diameter >= 15
            if button.force_required >= 25
              with_percentual(4.80) do
                recommend_button_msg09 button
              end
            else
              with_percentual(1.60) do
                recommend_button_msg10 button
              end
            end
          end
        end
      end

      for_each_item_in :switches do |switch|
        # check these blocks if - elsif or if - if
        if switch.pressing or switch.pulling or switch.pushing
          if switch.two_fingers_press or switch.pinch_grip or switch.pinch_grip_2 or switch.disc_grip or switch.disc_grip_2
            if switch.length_or_external_diameter <= 20
              with_percentual(6.00) do
                recommend_switch_msg01 switch
              end
            elsif switch.length_or_external_diameter > 20
              if switch.force_required >= 23
                with_percentual(4.80) do
                  recommend_switch_msg03 switch
                end
              elsif switch.force_required < 23
                with_percentual(1.50) do
                  recommend_switch_msg04 switch
                end
              end
            end
          elsif switch.one_finger_press
            if switch.length_or_external_diameter < 13
              with_percentual(6.00) do
                recommend_switch_msg01 switch
              end
            elsif switch.length_or_external_diameter >= 13
              if switch.force_required >= 15
                with_percentual(4.80) do
                  recommend_switch_msg07 switch
                end
              elsif switch.force_required < 15
                with_percentual(3.40) do
                  recommend_switch_msg08 switch
                end
              elsif switch.force_required < 11.2
                with_percentual(2.60) do
                  recommend_switch_msg09 switch
                end
              elsif switch.force_required < 0.5
                with_percentual(2.80) do
                  recommend_switch_msg10 switch
                end
              else
                with_percentual(2.60) do
                  recommend_switch_msg09 switch
                end
              end
            end
          elsif switch.thumb_press
            if switch.length_or_external_diameter < 15
              with_percentual(6.00) do
                recommend_switch_msg01 switch
              end
            elsif switch.length_or_external_diameter >= 15
              if switch.force_required >= 25
                with_percentual(4.80) do
                  recommend_switch_msg11 switch
                end
              else
                with_percentual(1.60) do
                  recommend_switch_msg12 switch
                end
              end
            end
          end
        elsif switch.turning
          if Switch::SHAPE_VALUES[0..4].include?(switch.shape)
            if switch.pinch_grip or switch.pinch_grip_2 or switch.disc_grip or switch.disc_grip_2
              if switch.length_or_external_diameter > 80
                with_percentual(6.00) do
                  recommend_switch_msg13 switch
                end
              elsif switch.length_or_external_diameter > 28
                if switch.force_required >= 0.56
                  with_percentual(4.80) do
                    recommend_switch_msg14 switch
                  end
                else
                  with_percentual(2.30) do
                    recommend_switch_msg15 switch
                  end
                end
              elsif switch.length_or_external_diameter <= 28
                if switch.force_required >= 0.56
                  with_percentual(6.00) do
                    recommend_switch_msg14 switch
                    recommend_switch_msg16 switch
                  end
                else
                  with_percentual(4.80) do
                    recommend_switch_msg17 switch
                  end
                end
              end
            end
          elsif Switch::SHAPE_VALUES[5..9].include?(switch.shape)
            if switch.pinch_grip or switch.pinch_grip_2 or switch.disc_grip or switch.disc_grip_2
              if switch.length_or_external_diameter > 65
                with_percentual(6.00) do
                  recommend_switch_msg18 switch
                end
              elsif switch.length_or_external_diameter > 31
                if switch.force_required >= 0.69
                  with_percentual(4.80) do
                    recommend_switch_msg19 switch
                  end
                else
                  with_percentual(2.30) do
                    recommend_switch_msg15 switch
                  end
                end
              elsif switch.length_or_external_diameter <= 31
                if switch.force_required >= 0.69
                  with_percentual(6.00) do
                    recommend_switch_msg19 switch
                    recommend_switch_msg16 switch
                  end
                else
                  with_percentual(4.80) do
                    recommend_switch_msg17 switch
                  end
                end
              end
            elsif switch.thumb_press or switch.one_finger_press or switch.two_finger_press
              with_percentual(6.00) do
                recommend_switch_msg20 switch
              end
            end
          end
        elsif switch.sliding
          if switch.two_fingers_press or switch.pinch_grip or switch.pinch_grip_2 or switch.disc_grip or switch.disc_grip_2 or switch.one_finger_press or switch.thumb_press
            if switch.length_or_external_diameter <= 13
              with_percentual(6.00) do
                recommend_switch_msg01 switch
                recommend_switch_msg21 switch
              end
            else #if switch.length_or_external_diameter > 13
              if switch.force_required >= 4.5
                with_percentual(4.80) do
                  recommend_switch_msg22 switch
                end
              else #if switch.force_required < 4.5
                with_percentual(2.60) do
                  recommend_switch_msg23 switch
                end
              end
            end
          end
        end
      end

      for_each_item_in :knobs do |knob|
        # check these blocks if - elsif or if - if
        if knob.pressing or knob.pulling or knob.pushing
          if knob.two_fingers_press or knob.pinch_grip or knob.pinch_grip_2 or knob.disc_grip or knob.disc_grip_2
            if knob.length_or_external_diameter <= 20
              with_percentual(6.00) do
                recommend_knob_msg01 knob
              end
            elsif knob.length_or_external_diameter > 20
              if knob.force_required >= 23
                with_percentual(4.80) do
                  recommend_knob_msg03 knob
                end
              elsif knob.force_required < 23
                with_percentual(1.50) do
                  recommend_knob_msg04 knob
                end
              end
            end
          elsif knob.one_finger_press
            if knob.length_or_external_diameter < 13
              with_percentual(6.00) do
                recommend_knob_msg01 knob
              end
            elsif knob.length_or_external_diameter >= 13
              if knob.force_required >= 15
                with_percentual(4.80) do
                  recommend_knob_msg07 knob
                end
              elsif knob.force_required < 15
                with_percentual(3.40) do
                  recommend_knob_msg08 knob
                end
              elsif knob.force_required < 11.2
                with_percentual(2.60) do
                  recommend_knob_msg09 knob
                end
              elsif knob.force_required < 0.5
                with_percentual(2.80) do
                  recommend_knob_msg10 knob
                end
              else
                with_percentual(2.60) do
                  recommend_knob_msg09 knob
                end
              end
            end
          elsif knob.thumb_press
            if knob.length_or_external_diameter < 15
              with_percentual(6.00) do
                recommend_knob_msg01 knob
              end
            elsif knob.length_or_external_diameter >= 15
              if knob.force_required >= 25
                with_percentual(4.80) do
                  recommend_knob_msg11 knob
                end
              else
                with_percentual(1.60) do
                  recommend_knob_msg12 knob
                end
              end
            end
          end
        elsif knob.turning
          if Switch::SHAPE_VALUES[0..4].include?(knob.shape)
            if knob.pinch_grip or knob.pinch_grip_2 or knob.disc_grip or knob.disc_grip_2
              if knob.length_or_external_diameter > 80
                with_percentual(6.00) do
                  recommend_knob_msg13 knob
                end
              elsif knob.length_or_external_diameter > 28
                if knob.force_required >= 0.56
                  with_percentual(4.80) do
                    recommend_knob_msg14 knob
                  end
                else
                  with_percentual(2.30) do
                    recommend_knob_msg15 knob
                  end
                end
              elsif knob.length_or_external_diameter <= 28
                if knob.force_required >= 0.56
                  with_percentual(6.00) do
                    recommend_knob_msg14 knob
                    recommend_knob_msg16 knob
                  end
                else
                  with_percentual(4.80) do
                    recommend_knob_msg17 knob
                  end
                end
              end
            end
          elsif Switch::SHAPE_VALUES[5..9].include?(knob.shape)
            if knob.pinch_grip or knob.pinch_grip_2 or knob.disc_grip or knob.disc_grip_2
              if knob.length_or_external_diameter > 65
                with_percentual(6.00) do
                  recommend_knob_msg18 knob
                end
              elsif knob.length_or_external_diameter > 31
                if knob.force_required >= 0.69
                  with_percentual(4.80) do
                    recommend_knob_msg19 knob
                  end
                else
                  with_percentual(2.30) do
                    recommend_knob_msg15 knob
                  end
                end
              elsif knob.length_or_external_diameter <= 31
                if knob.force_required >= 0.69
                  with_percentual(6.00) do
                    recommend_knob_msg19 knob
                    recommend_knob_msg16 knob
                  end
                else
                  with_percentual(4.80) do
                    recommend_knob_msg17 knob
                  end
                end
              end
            elsif knob.thumb_press or knob.one_finger_press or knob.two_finger_press
              with_percentual(6.00) do
                recommend_knob_msg20 knob
              end
            end
          end
        elsif knob.sliding
          if knob.two_fingers_press or knob.pinch_grip or knob.pinch_grip_2 or knob.disc_grip or knob.disc_grip_2 or knob.one_finger_press or knob.thumb_press
            if knob.length_or_external_diameter <= 13
              with_percentual(6.00) do
                recommend_knob_msg01 knob
                recommend_knob_msg21 knob
              end
            else #if knob.length_or_external_diameter > 13
              if knob.force_required >= 4.5
                with_percentual(4.80) do
                  recommend_knob_msg22 knob
                end
              else #if knob.force_required < 4.5
                with_percentual(2.60) do
                  recommend_knob_msg23 knob
                end
              end
            end
          end
        end
      end
    end

    generate_results_for :visibility do
      for_each_item_in :labels do |label|
        if label.background_colour == label.text_colour
          with_percentual(5.35) do
            recommend_label_msg01 label
            recommend_label_msg02 label
            recommend_label_msg03 label
          end
        else
          if label.text_size < 12
            if label.reading_distance > 500
              with_percentual(4.35) do
                recommend_label_msg04 label
                recommend_label_msg01 label
                recommend_label_msg05 label
              end
            else
              with_percentual(3.35) do
                recommend_label_msg04 label
                recommend_label_msg01 label
              end
            end
          elsif label.text_size < 14
            if label.reading_distance > 500
              with_percentual(2.30) do
                recommend_label_msg04 label
                recommend_label_msg01 label
                recommend_label_msg05 label
              end
            else
              with_percentual(1.50) do
                recommend_label_msg04 label
                recommend_label_msg01 label
              end
            end
          elsif label.text_size >= 14
            if label.reading_distance > 500
              with_percentual(1.30) do
                recommend_label_msg05 label
                recommend_label_msg01 label
              end
            else
              with_percentual(0.70) do
                recommend_label_msg01 label
              end
            end
          else
            with_percentual(4.35) do
              recommend_label_msg04 label
              recommend_label_msg01 label
              recommend_label_msg05 label
            end
          end
        end
      end

      for_each_item_in :buttons do |button|
        if button.colour == button.background_colour
          with_percentual(5.35) do
            recommend_button_msg01 button
            recommend_button_msg02 button
            recommend_button_msg03 button
          end
        elsif button.length_or_external_diameter <= 3
          with_percentual(4.35) do
            recommend_button_msg04 button
            recommend_button_msg01 button
          end
        elsif button.length_or_external_diameter <= 5
          with_percentual(2.30) do
            recommend_button_msg04 button
            recommend_button_msg01 button
          end
        elsif button.length_or_external_diameter > 5
          with_percentual(1.30) do
            recommend_button_msg01 button
          end
        else
          with_percentual(4.35) do
            recommend_button_msg04 button
            recommend_button_msg01 button
          end
        end
      end

      for_each_item_in :switches do |switch|
        if switch.colour == switch.background_colour
          with_percentual(5.35) do
            recommend_switch_msg02 switch
            recommend_switch_msg05 switch
            recommend_switch_msg06 switch
          end
        elsif switch.length_or_external_diameter <= 3
          with_percentual(4.35) do
            recommend_switch_msg01 switch
            recommend_switch_msg02 switch
          end
        elsif switch.length_or_external_diameter <= 5
          with_percentual(2.30) do
            recommend_switch_msg01 switch
            recommend_switch_msg02 switch
          end
        elsif switch.length_or_external_diameter > 5
          with_percentual(1.30) do
            recommend_switch_msg02 switch
          end
        else
          with_percentual(4.35) do
            recommend_switch_msg01 switch
            recommend_switch_msg02 switch
          end
        end
      end

      for_each_item_in :knobs do |knob|
        if knob.colour == knob.background_colour
          with_percentual(5.35) do
            recommend_knob_msg02 knob
            recommend_knob_msg05 knob
            recommend_knob_msg06 knob
          end
        elsif knob.length_or_external_diameter <= 3
          with_percentual(4.35) do
            recommend_knob_msg01 knob
            recommend_knob_msg02 knob
          end
        elsif knob.length_or_external_diameter <= 5
          with_percentual(2.30) do
            recommend_knob_msg01 knob
            recommend_knob_msg02 knob
          end
        elsif knob.length_or_external_diameter > 5
          with_percentual(1.30) do
            recommend_knob_msg02 knob
          end
        else
          with_percentual(4.35) do
            recommend_knob_msg01 knob
            recommend_knob_msg02 knob
          end
        end
      end
    end
  end

  private
    def recommend_handle_msg01
      recommend I18n.t('messages.handle.msg01')
    end

    def recommend_handle_msg02(instance)
      recommend I18n.t('messages.handle.msg02')
      for_attributes :external_diameter
      of instance
    end

    def recommend_handle_msg03(instance)
      recommend I18n.t('messages.handle.msg03')
      for_attributes :external_diameter
      of instance
    end

    def recommend_handle_msg04
      recommend I18n.t('messages.handle.msg04')
      for_attributes :product_weight
      of self
    end

    def recommend_handle_msg05
      recommend I18n.t('messages.handle.msg05')
      for_attributes :product_weight
      of self
    end

    def recommend_handle_msg06
      recommend I18n.t('messages.handle.msg06')
      for_attributes :product_weight
      of self
    end

    def recommend_handle_msg07(instance)
      recommend I18n.t('messages.handle.msg07')
      for_attributes :pinch_grip
      of instance
    end

    def recommend_handle_msg08
      recommend I18n.t('messages.handle.msg08')
      for_attributes :product_weight
      of self
    end

    def recommend_handle_msg09
      recommend I18n.t('messages.handle.msg09')
      for_attributes :product_weight
      of self
    end

    def recommend_label_msg01(instance)
      recommend I18n.t('messages.label.msg01')
      for_attributes :text_colour, :background_colour
      of instance
    end

    def recommend_label_msg02(instance)
      recommend I18n.t('messages.label.msg02')
      for_attributes :text_colour, :background_colour
      of instance
    end

    def recommend_label_msg03(instance)
      recommend I18n.t('messages.label.msg03')
      for_attributes :text_colour, :background_colour
      of instance
    end

    def recommend_label_msg04(instance)
      recommend I18n.t('messages.label.msg04')
      for_attributes :text_size
      of instance
    end

    def recommend_label_msg05(instance)
      recommend I18n.t('messages.label.msg05')
      for_attributes :reading_distance
      of instance
    end

    def recommend_button_msg01(instance)
      recommend I18n.t('messages.button.msg01')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_button_msg02(instance)
      recommend I18n.t('messages.button.msg02')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_button_msg03(instance)
      recommend I18n.t('messages.button.msg03')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_button_msg04(instance)
      recommend I18n.t('messages.button.msg04')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_button_msg05(instance)
      recommend I18n.t('messages.button.msg05')
      for_attributes :force_required
      of instance
    end

    def recommend_button_msg06(instance)
      recommend I18n.t('messages.button.msg06')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_button_msg07(instance)
      recommend I18n.t('messages.button.msg07')
      for_attributes :force_required
      of instance
    end

    def recommend_button_msg08(instance)
      recommend I18n.t('messages.button.msg08')
      for_attributes :one_finger_press
      of instance
    end

    def recommend_button_msg09(instance)
      recommend I18n.t('messages.button.msg09')
      for_attributes :force_required
      of instance
    end

    def recommend_button_msg10(instance)
      recommend I18n.t('messages.button.msg10')
      for_attributes :thumb_press
      of instance
    end

    def recommend_switch_msg01(instance)
      recommend I18n.t('messages.switch.msg01')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg02(instance)
      recommend I18n.t('messages.switch.msg02')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_switch_msg03(instance)
      recommend I18n.t('messages.switch.msg03')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg04(instance)
      recommend I18n.t('messages.switch.msg04')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg05(instance)
      recommend I18n.t('messages.switch.msg05')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_switch_msg06(instance)
      recommend I18n.t('messages.switch.msg06')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_switch_msg07(instance)
      recommend I18n.t('messages.switch.msg07')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg08(instance)
      recommend I18n.t('messages.switch.msg08')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg09(instance)
      recommend I18n.t('messages.switch.msg09')
      for_attributes :one_finger_press
      of instance
    end

    def recommend_switch_msg10(instance)
      recommend I18n.t('messages.switch.msg10')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg11(instance)
      recommend I18n.t('messages.switch.msg11')
      for_attributes :one_finger_press
      of instance
    end

    def recommend_switch_msg12(instance)
      recommend I18n.t('messages.switch.msg12')
      for_attributes :thumb_press
      of instance
    end

    def recommend_switch_msg13(instance)
      recommend I18n.t('messages.switch.msg13')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg14(instance)
      recommend I18n.t('messages.switch.msg14')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg15(instance)
      recommend I18n.t('messages.switch.msg15')
      for_attributes :turning
      of instance
    end

    def recommend_switch_msg16(instance)
      recommend I18n.t('messages.switch.msg16')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg17(instance)
      recommend I18n.t('messages.switch.msg17')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg18(instance)
      recommend I18n.t('messages.switch.msg18')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_switch_msg19(instance)
      recommend I18n.t('messages.switch.msg19')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg20(instance)
      recommend I18n.t('messages.switch.msg20')
      for_attributes :pushing
      of instance
    end

    def recommend_switch_msg21(instance)
      recommend I18n.t('messages.switch.msg21')
      for_attributes :sliding
      of instance
    end

    def recommend_switch_msg22(instance)
      recommend I18n.t('messages.switch.msg22')
      for_attributes :force_required
      of instance
    end

    def recommend_switch_msg23(instance)
      recommend I18n.t('messages.switch.msg23')
      for_attributes :sliding
      of instance
    end

    def recommend_knob_msg01(instance)
      recommend I18n.t('messages.knob.msg01')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg02(instance)
      recommend I18n.t('messages.knob.msg02')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_knob_msg03(instance)
      recommend I18n.t('messages.knob.msg03')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg04(instance)
      recommend I18n.t('messages.knob.msg04')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg05(instance)
      recommend I18n.t('messages.knob.msg05')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_knob_msg06(instance)
      recommend I18n.t('messages.knob.msg06')
      for_attributes :colour, :background_colour
      of instance
    end

    def recommend_knob_msg07(instance)
      recommend I18n.t('messages.knob.msg07')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg08(instance)
      recommend I18n.t('messages.knob.msg08')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg09(instance)
      recommend I18n.t('messages.knob.msg09')
      for_attributes :one_finger_press
      of instance
    end

    def recommend_knob_msg10(instance)
      recommend I18n.t('messages.knob.msg10')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg11(instance)
      recommend I18n.t('messages.knob.msg11')
      for_attributes :one_finger_press
      of instance
    end

    def recommend_knob_msg12(instance)
      recommend I18n.t('messages.knob.msg12')
      for_attributes :thumb_press
      of instance
    end

    def recommend_knob_msg13(instance)
      recommend I18n.t('messages.knob.msg13')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg14(instance)
      recommend I18n.t('messages.knob.msg14')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg15(instance)
      recommend I18n.t('messages.knob.msg15')
      for_attributes :turning
      of instance
    end

    def recommend_knob_msg16(instance)
      recommend I18n.t('messages.knob.msg16')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg17(instance)
      recommend I18n.t('messages.knob.msg17')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg18(instance)
      recommend I18n.t('messages.knob.msg18')
      for_attributes :length_or_external_diameter
      of instance
    end

    def recommend_knob_msg19(instance)
      recommend I18n.t('messages.knob.msg19')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg20(instance)
      recommend I18n.t('messages.knob.msg20')
      for_attributes :pushing
      of instance
    end

    def recommend_knob_msg21(instance)
      recommend I18n.t('messages.knob.msg21')
      for_attributes :sliding
      of instance
    end

    def recommend_knob_msg22(instance)
      recommend I18n.t('messages.knob.msg22')
      for_attributes :force_required
      of instance
    end

    def recommend_knob_msg23(instance)
      recommend I18n.t('messages.knob.msg23')
      for_attributes :sliding
      of instance
    end
end
