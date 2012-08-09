Project.transaction do
  (1..100).each do |i|
    Project.create(name: "Project#{i}", target_market: "Target#{i}",
                    timescale: "#{i} days", volume_of_sale: i * 1000, 
                    final_price: rand(100.0..10000.0))
  end
end
