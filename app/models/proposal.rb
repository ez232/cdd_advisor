class Proposal < ActiveRecord::Base
  include(Results)

  attr_accessible :name, :product_weight, :key_components_mechanics,
    :key_components_electronics, :key_components_fixing, :material_value_ids,
    :manufacturing_value_ids, :finishing_value_ids, :maintenance_value_ids

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
    end

    generate_results_for :visibility do
      for_each_item_in :labels do |label|
        # FIXME
        # if product_colour == label.text_colour
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
      recommend I18n.t('messages.labels.msg05')
      for_attributes :reading_distance
      of instance
    end
end
