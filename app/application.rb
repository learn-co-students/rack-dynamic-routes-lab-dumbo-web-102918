require "pry"

class Application

@@items = []
  def call (env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)



    if req.path.match (/items/)
      route = req.path
      var = route.split("/items/")[-1]


      query = @@items.find {|it| it.name == var}

      if query != nil
        resp.write query.price
      else
        resp.write "Item not found"
        resp.status = 400
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish

  end

end
