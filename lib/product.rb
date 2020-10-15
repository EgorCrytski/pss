# frozen_string_literal: true

require_relative 'page'

class Product
  attr_reader :name
  attr_reader :price
  attr_reader :image

  def initialize(name, price, image)
    @name = name
    @price = price
    @image = image
  end

  def print
    puts("name: #{@name};\nprice: #{@price};\nimage: #{@image}\n\n")
  end
end
