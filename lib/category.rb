require 'nokogiri'
require 'curb'
require_relative 'page'
require_relative 'product'
require_relative 'constants'

class Category
  attr_reader :products

  def initialize(url)
    @url = url
    @products = get_products
  end

  private

  def get_products_urls
    products_urls = []
    current_page = 1

    loop do
      unless current_page > 1
        page = Page.new(@url)
      else
        page = Page.new(@url+"?p=#{current_page}")
      end
      unless page.status != '200'
        page.body.xpath(Constants::XP_PRODUCT_URLS).each do |url|
          products_urls << url[:href]
        end
        current_page += 1
      else
        break
      end
    end
    return products_urls
  end

  def get_products
    products_urls = get_products_urls
    products = []

    for url in products_urls
      page = Page.new(url)
      puts(page.status)
    puts(page.body.xpath(Constants::XP_PRODUCT_VARIATIONS))
    end

  end

end
