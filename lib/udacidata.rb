require_relative 'find_by'
require_relative 'errors'
require 'csv'

class Udacidata
  # Your code goes here!

  @@data_path = File.dirname(__FILE__) + "/../data/data.csv"

  def self.create(attributes = nil)
    CSV.foreach(@@data_path) do |line|
      if line == attributes
        line_object = self.new(attributes)
        return line_object
      elsif line != attributes
        line_object = self.new(attributes)
          CSV.open(@@data_path, 'a') do |database|
            database << [line_object.id, line_object.brand, line_object.name, line_object.price]
          end
        return line_object
      end
    end
  end

  def self.all
    item_array = []
      CSV.foreach(@@data_path, headers: true) do |line|
        item_array.push(self.new(id: line['id'], brand:  line['brand'], name: line['product'], price: line['price']))
      end
    return item_array
  end

  def self.first(arg = 1)
    if (arg > 1) then
      self.all.first(arg)
    else
      self.all.first
    end
  end

  def self.last(arg = 1)
    if (arg > 1) then
      self.all.last(arg)
    else
      self.all.last
    end
  end

  def self.find(arg)

      self.all.each do |item|
        if item.id == arg
          return item
        end
      end


  end


  def self.destroy(arg)
    item_to_delete = find(arg)
      database = CSV.table(@@data_path)


        database.delete_if do |line|
          line[:id] == arg
        end


    File.open(@@data_path, 'w') do |file|
      file.write(database.to_csv)
    end

=begin
    CSV.open(@@data_path, 'w') do |file|
        file << database[0]
        database.each do |line|
          file << line
        end
    end
=end
    return item_to_delete
  end

  def self.find_by_brand(arg)
    self.all.each do |item|
      if item.brand == arg
        return item
      end
    end
  end

  def self.find_by_name(arg)
    self.all.each do |item|
      if item.name == arg
        return item
      end
    end
  end

  def self.where(opts = {})
    self.all.select do |item|
      opts[:brand] == item.brand || opts[:name] == item.name
    end
  end



end




