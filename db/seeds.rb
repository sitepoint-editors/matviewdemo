# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['web', 'mobile', 'offline'].each do |name|
  Channel.create(name: name)
end

['book', 'guitar', 'violin', 'shirt', 'shade', 'shoe', 'toy', 'mobile'].each do |name|
  Item.create(name: name, price: (rand(100) + 1))
end

channels = Channel.count
items = Item.all

(1..1000000).each do |i|
  data = {}
  item = items.shuffle.first
  data[:item_id] = item.id
  data[:quantity] = 1 + rand(100)
  data[:amount] = data[:quantity] * item.price
  data[:sold_date] = rand(1.years).seconds.ago
  data[:code] = SecureRandom.hex(5)
  data[:channel_id] = rand(channels) + 1
  Sale.create(data)
  puts "created sale - #{i}"
end
