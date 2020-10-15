# frozen_string_literal: true

require_relative './lib/page'
require_relative './lib/product'
require_relative './lib/category'
require_relative './lib/csv'

url = ARGV.first
csv_name = ARGV.last

category = Category.new(url)
category.load_products
csv = CSVWriter.new(csv_name)
csv.write_product(category.products)
puts('Job done')
