require 'nokogiri'
require 'curb'
require_relative 'page'

class Product
  attr_accessor :name
  attr_accessor :price
  attr_accessor :image

  def initialize; end

  def print
    puts("name: #{@name}; price: #{@price}; image: #{@image}")
  end
end
