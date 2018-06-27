# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.destroy_all

makeup = Category.create(name: 'Makeup')


## Level One
makeup_cheek = Category.create(name: 'Cheek', parent: makeup)
makeup_face = Category.create(name: 'Face', parent: makeup)

description = 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et'

## Face
makeup_face_contouring = Category.create(name: 'Contouring', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_contouring.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_contouring.id)
  end

makeup_face_primer = Category.create(name: 'Primer', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_primer.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_primer.id)
  end

makeup_face_tools = Category.create(name: 'Tools', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_tools.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_tools.id)
  end

makeup_face_foundation = Category.create(name: 'Foundation', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_foundation.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_foundation.id)
  end

makeup_face_face_powder = Category.create(name: 'Face Powder', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_face_powder.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_face_powder.id)
  end

makeup_face_conceler = Category.create(name: 'Conceler', parent: makeup_face)
  40.times.each do |index|
    Product.create(name: "Product_#{makeup_face_face_powder.name}_#{index}", price: (index*11), description: description, image_url: "https://picsum.photos/200/200/?image=#{index}", category_id: makeup_face_face_powder.id)
  end



