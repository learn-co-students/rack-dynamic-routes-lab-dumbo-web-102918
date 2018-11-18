require 'pry'

class Application

  @@items = []
  [["Apples", 3], ["Pear", 2], ["Oranges", 1], ["Milk", 2], ["Fig", 4]].each do |item|
    @@items << Item.new(item[0], item[1])
  end

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      route = req.path
      route_item = route.split("/items/")
      if route_item.count > 1
        item_found = item_check(route_item[1])
        if item_found.is_a?Numeric
          resp.write item_found
        else
          resp.write item_found
          resp.status = 400
        end
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def item_check(item)
    item_found = @@items.find do |item_obj|
      item_obj.name == item
      # binding.pry
    end
    if item_found
      return item_found.price

    else
      return "Item not found"
    end
  end
end
