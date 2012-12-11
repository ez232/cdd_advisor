Project.destroy_all
Project.transaction do
  project = Project.create! name: 'Project 1',
                            timescale: '12',
                            volume_of_sale: 200,
                            final_price: 300.00

  proposal = project.proposals.create! name: 'Proposal 1',
                                       product_weight: 100.0


  (1..2).each do |i|
    proposal.labels.create! name: "Label #{i}",
                            text_size: 10.5 * i,
                            text_colour: "blue",
                            background_colour: "yellow",
                            reading_distance: 100 / i

    proposal.handles.create! name: "Handle #{i}",
                             holding: true,
                             shape: 'Organic',
                             external_diameter: 100.0 / i,
                             width: 20.0 * i,
                             height: 20.0 * i * 2,
                             pinch_grip_2: true,
                             hook_grip: true
  end
end
