require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"


    def self.create(attributes = nil)

      CSV.foreach(@@data_path) do |line|

        if line == attributes

          return self.new

        else

            new_item = self.new(attributes)

            CSV.open(@@data_path, 'a') do |csv|

               csv << [new_item.id, new_item.brand, new_item.name, new_item.price]

            end

            return new_item
        end

      end

    end


end




      #    new_product = self.new
      #
      #    CSV.open(@@data_path, "wb") do |csv|
      #
      #      csv << [attributes.key => attributes.value]
      #      #options = [new_product.brand.to_s];[new_product.brand.to_s];[new_product.name.to_s];[new_product.price]
      #
      #      #["id", "brand", "product", "price"]
      #    end