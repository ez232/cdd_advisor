class AddRequirementsToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :target_market, :text
    add_column :proposals, :market_share, :text
    add_column :proposals, :market_response, :text
    add_column :proposals, :volume_of_sale, :text
    add_column :proposals, :final_price, :text
    add_column :proposals, :project_timescale, :text
    add_column :proposals, :sustainability, :text
    add_column :proposals, :social_responsibility, :text
    add_column :proposals, :impact_on_brand, :text

    add_column :proposals, :functionality, :text
    add_column :proposals, :aesthetics, :text
    add_column :proposals, :manufacturing, :text
    add_column :proposals, :components, :text
    add_column :proposals, :usability_accessibility, :text
    add_column :proposals, :materials, :text
    add_column :proposals, :finishing, :text
    add_column :proposals, :maintenance, :text
    add_column :proposals, :disposal, :text
  end
end
