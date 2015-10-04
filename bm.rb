require 'benchmark'

# Channel per item
puts "Channel per item"
Benchmark.bm do |bm|
  bm.report("AR") do
    Sale.joins(:channel).joins(:item).where('channels.name = ?', 'web').group('items.name').sum(:amount)
  end

  bm.report("MV") do
    SalesMatview.where('channel = ?', 'web').group(:item).sum(:amount)
  end
end

puts "Channel overall"
Benchmark.bm do |bm|
  bm.report("AR") do
    Sale.joins(:channel).group('channels.name').sum(:amount)
  end

  bm.report("MV") do
    SalesMatview.group(:channel).sum(:amount)
  end
end

puts "Sales per day"
Benchmark.bm do |bm|
  
  bm.report("AR") do
    Sale.group("DATE_TRUNC('day', sold_date)").sum(:amount)
  end

  bm.report("MV") do
    SalesMatview.group(:date).sum(:amount)
  end
end
