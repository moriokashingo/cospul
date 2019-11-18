json.array! @items do |item|
  json.name             item.name
  json.url              item.url
  json.small_image_urls item.small_image_urls
  json.price            item.price
end

