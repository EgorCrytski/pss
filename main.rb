require_relative "./lib/page"
require_relative "./lib/product"
require_relative "./lib/category"
require_relative "./lib/csv"

url = "https://www.petsonic.com/pienso-acana-para-gatos/"
category = Category.new(url)
category.load_products
csv = CSVWriter.new("test.csv")
csv.write_product(category.products)
puts("Job done")
