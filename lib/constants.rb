module Constants
  XP_PRODUCT_URLS = "//*[@id='product_list']/li/div[1]/div[2]/div[2]/a"
  XP_PRODUCT_VARIATIONS = "//*[@id='attributes']/fieldset/div/ul/child::node()"
  XP_PRODUCT_NAME = "//h1[@class='product_main_name']/text()"
  XP_PRODUCT_WEIGHT = "//*[@class='radio_label']/text()"
  XP_PRODUCT_PRICE = "//*[@class='price_comb']/text()"
  XP_PRODUCT_PHOTO_URL = "//img[@id='bigpic']/@src"
end
