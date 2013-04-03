categories = %w{appliances antiques bikes books computer electronics free furniture jewelry sporting tools}



categories.each do |category|
  Category.create(name: category)
end
