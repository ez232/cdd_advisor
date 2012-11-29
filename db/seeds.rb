# This file should contain all the record creation needed to seed the database
# with its default values. The data can then be loaded with the rake db:seed (or
# created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ManufacturingValue.destroy_all
ManufacturingValue.create!([{ name: 'Molding' },
                            { name: 'Casting' },
                            { name: 'Bulk Forming' },
                            { name: 'Sheet Forming'  },
                            { name: 'Lay-up Methods'  },
                            { name: 'Powder Methods' },
                            { name: 'Joining Methods' }])

FinishingValue.destroy_all
FinishingValue.create!([{ name: 'Printing' },
                        { name: 'Plating' },
                        { name: 'Polishing' },
                        { name: 'Coating' },
                        { name: 'Etching' },
                        { name: 'Texturing'}])

MaintenanceValue.destroy_all
MaintenanceValue.create!([{ name: 'Changing Parts' },
                          { name: 'Cleaning' },
                          { name: 'Fixing' }])

MaterialValue.destroy_all
MaterialValue.create!([{ category: 'Natural', name: 'Bamboo' },
                       { category: 'Natural', name: 'Balsa' },
                       { category: 'Natural', name: 'Cork' },
                       { category: 'Natural', name: 'Leather' },
                       { category: 'Natural', name: 'Wood' },
                       { category: 'Ceramic & Glasses', name: 'Soda-lime Glass' },
                       { category: 'Ceramic & Glasses', name: 'Silica Glass' },
                       { category: 'Ceramic & Glasses', name: 'Barosilicate' },
                       { category: 'Ceramic & Glasses', name: 'Glass Ceramic' },
                       { category: 'Ceramic & Glasses', name: 'Alumina' },
                       { category: 'Ceramic & Glasses', name: 'Silicon Carbide' },
                       { category: 'Polymer', name: 'Polyethylene - PE' },
                       { category: 'Polymer', name: 'Polypropylene - PP' },
                       { category: 'Polymer', name: 'Polystyrene - PS' },
                       { category: 'Polymer', name: 'ABS' },
                       { category: 'Polymer', name: 'Polyamide - PA' },
                       { category: 'Polymer', name: 'Nylon' },
                       { category: 'Polymer', name: 'Polymethylmethathacrylate - PMMA' },
                       { category: 'Polymer', name: 'Acrylic' },
                       { category: 'Polymer', name: 'Polycarbonate - PC' },
                       { category: 'Polymer', name: 'Acetal' },
                       { category: 'Polymer', name: 'Ionometers' },
                       { category: 'Polymer', name: 'Celluloses' },
                       { category: 'Polymer', name: 'PEEK' },
                       { category: 'Polymer', name: 'PVC' },
                       { category: 'Polymer', name: 'PU' },
                       { category: 'Polymer', name: 'Silicones' },
                       { category: 'Polymer', name: 'Polyesters - PET' },
                       { category: 'Polymer', name: 'PBT' },
                       { category: 'Polymer', name: 'Epoxy' },
                       { category: 'Polymer', name: 'Phenolic' },
                       { category: 'Polymer', name: 'Elastomers' },
                       { category: 'Polymer', name: 'Polymer Foams ' },
                       { category: 'Polymer', name: 'Polymer composites' },
                       { category: 'Metal', name: 'Carbon Steels' },
                       { category: 'Metal', name: 'Stainless Steels' },
                       { category: 'Metal', name: 'Low Alloy Steels' },
                       { category: 'Metal', name: 'Aluminium Alloy' },
                       { category: 'Metal', name: 'Magnesium Alloy' },
                       { category: 'Metal', name: 'Cooper Alloy - Brass / Bronze' },
                       { category: 'Metal', name: 'Titanium Alloy' },
                       { category: 'Metal', name: 'Nickel Alloy' },
                       { category: 'Metal', name: 'Zinc Alloy' },
                       { category: 'Fibers', name: 'Glass Fibers' },
                       { category: 'Fibers', name: 'Carbon Fibers' },
                       { category: 'Fibers', name: 'Aramid Fibers' },
                       { category: 'Fibers', name: 'Hemp' },
                       { category: 'Fibers', name: 'Silicon Carbide Fibers' }])
