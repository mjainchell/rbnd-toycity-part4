require 'faker'

# This file contains code that populates the database with
# fake data for testing purposes

def db_seed
  # Your code goes here!

  brands = []
  product_names = []
  prices = []
  10.times do
    brands.push(Faker::Company.name)
    product_names.push(Faker::Commerce.product_name)
    prices.push(Faker::Commerce.price(10..50))
  end

  10.times do
      Product.create(brand: brands.sample, name: product_names.sample, price: prices.sample )
  end

end

