# frozen_string_literal: true

require_relative 'page'
require_relative 'product'
require_relative 'constants'

class Category
  attr_reader :products

  def initialize(url)
    @url = url
  end

  private

  def get_products_urls
    puts("Getting links to products in a category...\n")
    products_urls = []
    current_page = 1

    loop do
      puts("\nCurrent page: #{current_page}")
      page = if current_page == 1
               Page.new(@url)
             else
               Page.new(@url + "?p=#{current_page}")
             end
      if page.status == '200'
        page.body.xpath(Constants::XP_PRODUCT_URLS).each do |url|
          puts(url[:href])
          products_urls << url[:href]
        end
        current_page += 1
      else
        puts("The page does not exist. Links collected\n\n")
        break
      end
    end
    return products_urls
  end

  public

  def load_products
    products_urls = get_products_urls
    products = []
    puts("Parse all products in a category\n\n")
    products_urls.each do |url|
      page = Page.new(url)
      var = 0
      product_name = page.body.xpath(Constants::XP_PRODUCT_NAME)
      picture = page.body.xpath(Constants::XP_PRODUCT_PHOTO_URL)
      variations = page.body.xpath(Constants::XP_PRODUCT_VARIATIONS)

      variations.each do |data|
        weight = data.xpath(Constants::XP_PRODUCT_WEIGHT)[var]
        variation_name = "#{product_name} - #{weight}"
        price = data.xpath(Constants::XP_PRODUCT_PRICE)[var]
        product = Product.new(variation_name, price, picture)
        products << product
        product.print
        var += 1
      end
    end
    puts("Done. Products have been parsed\n\n")
    @products = products
  end
end
