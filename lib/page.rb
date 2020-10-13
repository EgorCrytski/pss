require 'nokogiri'
require 'curb'

class Page
  @@number_of_pages = 0
  def initialize(url)
    @page_url = url
    @body = load
  end

  def print_body
    puts(@body)
  end

  private

  def load
    Nokogiri::HTML(Curl.get(@page_url).body_str)
  end
end
