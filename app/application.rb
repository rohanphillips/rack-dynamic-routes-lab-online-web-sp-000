class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      add_item = req.params["item"]
      item = @@items.find{|item| item.name == add_item}
      resp.write(add_item)
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

end
