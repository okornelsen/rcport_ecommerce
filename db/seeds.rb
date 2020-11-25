require "csv"

Productcategory.delete_all
Category.delete_all
Product.delete_all
Pricetype.delete_all
Province.delete_all

def load_csv(csvfile)
  filename = File.join(Rails.root, "db", csvfile)
  dataset = File.read(filename, encoding: "bom|utf-8")
  data = CSV.parse(dataset, headers: true)
  data
end

categories = load_csv("categories.csv")
products = load_csv("products_v2.csv")
pricetypes = load_csv("pricetypes.csv")
provinces = load_csv("provinces.csv")

categories.each do |category|
  Category.create(
    name:        category["vehicle_type"],
    description: category["description"]
  )
end

pricetypes.each do |pricetype|
  Pricetype.create(
    name:        pricetype["price_type"],
    description: pricetype["description"]
  )
end

provinces.each do |province|
  Province.create(
    name:         province["name"],
    abbrev:       province["abbrev"],
    gst:          province["gst"],
    pst:          province["pst"],
    hst:          province["hst"]
  )
end

products.each do |product|
  pricetype = Pricetype.find_by(name: product["price_type"])
  next unless pricetype.valid?

  product_to_create = pricetype.products.create(
    name:         product["name"],
    price:        product["price"],
    sku:          product["sku"],
    description:  product["description"],
    part_no:      product["part_no"],
    brand:        product["brand"],
    terrain_type: product["terrain_type"],
    drive_train:  product["drive_train"],
    scale:        product["scale"],
    saleprice:    product["sale_price"]
  )

  if product_to_create.valid?

    filename = product["image"]
    filepath = "app/assets/images/" + filename
    product_to_create.image.attach(io: File.open(filepath), filename: filename)

    pc = product["vehicle_type"].split(",")
    pc.each do |p|
      category = Category.find_by(name: p)
      next if category.nil?

      Productcategory.create(
        product:  product_to_create,
        category: category
      )
    end
  else
    puts "Error with #{product_to_create.inspect}"
  end
end
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end
