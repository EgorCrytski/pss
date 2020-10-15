require 'csv'

class CSVWriter
  def initialize(file_name)
    @name = file_name
    @full_path = Dir.pwd << '/output/' << @name
  end

  def write_product(products)
    CSV.open(@full_path, 'wb', write_headers: true, headers: %w[Name Price Image]) do |csv_string|
      products.each do |product|
        csv_string << [product.name, product.price, product.image]
      end
    end
    puts("CSV writing completed\n\n")
  end
end
