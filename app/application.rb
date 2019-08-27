class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_request = req.path.split("/items/").last
      item = @@items.find{|item| item.name == item_request}
      binding.pry
      resp.write(item.price)
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
