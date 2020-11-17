require "csv"

Productcategory.delete_all
Category.delete_all
Product.delete_all
Pricetype.delete_all

def load_csv(csvfile)
  filename = File.join(Rails.root, "db", csvfile)
  dataset = File.read(filename, encoding: "bom|utf-8")
  data = CSV.parse(dataset, headers: true)
  data
end

categories = load_csv("categories.csv")
products = load_csv("products_v2.csv")
pricetypes = load_csv("pricetypes.csv")

categories.each do |category|
  Category.create(
    vehicle_type: category["vehicle_type"],
    description:  category["description"]
  )
end

pricetypes.each do |pricetype|
  Pricetype.create(
    name:        pricetype["price_type"],
    description: pricetype["description"]
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
    image:        product["image"],
    saleprice:    product["sale_price"]
  )

  if product_to_create.valid?
    pc = product["vehicle_type"].split(",")
    pc.each do |p|
      category = Category.find_by(vehicle_type: p)
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
