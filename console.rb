require_relative("models/property.rb")

# Property.delete_all

property_1 = Property.new({
  'address' => 'Coronation Street',
  'value' => 3000,
  'bedroom_number' => 3,
  'year' => 1984,
  'status' => 'buy',
  'size' => 100,
  'type' => 'semi-detached'
})

property_2 = Property.new({
  'address' => 'Baxtreet',
  'value' => 3000,
  'bedroom_number' => 3,
  'year' => 1984,
  'status' => 'buy',
  'size' => 100,
  'type' => 'semi-detached'
})


property_1.save
property_2.save

property_1.value = 5000

property_1.update()

house = Property.find(10)

my_house = Property.find_by_address('Baxtreet')
p my_house
# property_2.save
# p property_1

property_1.delete()
