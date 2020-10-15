# frozen_string_literal: true

require 'nokogiri'
require 'curb'

class Page
  attr_reader :body
  attr_reader :url
  attr_reader :status

  def initialize(url)
    @url = url
    @body = load
  end

  private

  def load
    http = Curl.get(@url)
    @status = http.status
    Nokogiri::HTML(http.body_str)
  end
end
