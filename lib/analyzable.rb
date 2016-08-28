module Analyzable
  # Your code goes here!

    def average_price(products)
      total_sales = 0
      products.each do |product|
        total_sales += product.price.to_f
      end
      average = (total_sales / products.length).round(2)
      return average
    end

    def print_report(products)
     puts 'Average Product Price'
     puts '$' + "#{average_price(products)}"
     puts
     puts 'Inventory By Brand:'
       count_by_brand(products).each do |brand_name, inventory_count|
         puts '-- ' + brand_name + ': ' + inventory_count.to_s
       end
     puts
     puts 'Inventory By Name:'
       count_by_name(products).each do |product_name, inventory_count|
         puts '-- ' + product_name + ': ' + inventory_count.to_s
       end
     puts
     return String.new
    end

    def count_by_brand(products)
      product_brand_array = []
        products.each do |product|
          product_brand_array.push(product.brand)
        end
      counter = Hash.new(0)
        product_brand_array.each do |product|
          counter[product] += 1
        end
      return counter
    end

    def count_by_name(products)
      product_name_array = []
        products.each do |product|
          product_name_array.push(product.name)
        end
      counter = Hash.new(0)
        product_name_array.each do |product|
          counter[product] += 1
        end
      return counter
    end

end
