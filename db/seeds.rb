puts "==== Create  Brands ===="
Brand.destroy_all
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE brands_id_seq RESTART WITH 1"
)

new_balance = Brand.create!(name: 'New Balance')
nice        = Brand.create!(name: 'Nice')
adidas      = Brand.create!(name: 'Adidas')
puma        = Brand.create!(name: 'Puma')
fila        = Brand.create!(name: 'Fila')
asics       = Brand.create!(name: 'ASICS')
puts "==== End ===="

puts "==== Create  Shoes ===="
Shoe.destroy_all
ActiveRecord::Base.connection.execute(
  "ALTER SEQUENCE shoes_id_seq RESTART WITH 1"
)

img_shoe_1 = "#{Rails.root}/app/assets/images/shoes/shoe-1.png"
img_shoe_2 = "#{Rails.root}/app/assets/images/shoes/shoe-2.png"
img_shoe_3 = "#{Rails.root}/app/assets/images/shoes/shoe-3.png"
img_shoe_4 = "#{Rails.root}/app/assets/images/shoes/shoe-4.png"
img_shoe_5 = "#{Rails.root}/app/assets/images/shoes/shoe-5.png"
img_shoe_6 = "#{Rails.root}/app/assets/images/shoes/shoe-6.png"
img_shoe_7 = "#{Rails.root}/app/assets/images/shoes/shoe-7.png"
img_shoe_8 = "#{Rails.root}/app/assets/images/shoes/shoe-8.png"
img_shoe_9 = "#{Rails.root}/app/assets/images/shoes/shoe-9.png"
img_shoe_10 = "#{Rails.root}/app/assets/images/shoes/shoe-10.png"
img_shoe_11 = "#{Rails.root}/app/assets/images/shoes/shoe-11.png"
img_shoe_12 = "#{Rails.root}/app/assets/images/shoes/shoe-12.png"



5.times.each do |time|
  new_balance.shoes.create!([
    {name: "New Balance - shoe #{time}", sku: "MX111V#{time}", price: 10, image: File.open(img_shoe_1)},
    {name: "New Balance - shoe #{time}", sku: "MX222V#{time}", price: 25, image: File.open(img_shoe_2)}
  ])
  nice.shoes.create!([
    {name: "Nice - shoe #{time}", sku: "MX333V#{time}", price: 20, image: File.open(img_shoe_3)},
    {name: "Nice - shoe #{time}", sku: "MX444V#{time}", price: 50, image: File.open(img_shoe_4)}
  ])
  adidas.shoes.create!([
    {name: "Adidas - shoe #{time}", sku: "MX555V#{time}", price: 42, image: File.open(img_shoe_5)},
    {name: "Adidas - shoe #{time}", sku: "MX666V#{time}", price: 70, image: File.open(img_shoe_6)}
  ])
  puma.shoes.create!([
    {name: "Puma - shoe #{time}", sku: "MX777V#{time}", price: 66, image: File.open(img_shoe_7)},
    {name: "Puma - shoe #{time}", sku: "MX888V#{time}", price: 99, image: File.open(img_shoe_8)}
  ])
  fila.shoes.create!([
    {name: "Fila - shoe #{time}", sku: "MX999V#{time}", price: 21.21, image: File.open(img_shoe_9)},
    {name: "Fila - shoe #{time}", sku: "MX1010V#{time}", price: 89.99, image: File.open(img_shoe_10)}
  ])
  asics.shoes.create!([
    {name: "Asics - shoe #{time}", sku: "MX11011V#{time}", price: 32, image: File.open(img_shoe_11)},
    {name: "Asics - shoe #{time}", sku: "MX12012V#{time}", price: 22.1, image: File.open(img_shoe_12)}
  ])
end

puts "==== End ===="