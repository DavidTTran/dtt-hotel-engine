class DndService
  def classes
    response = parse_response(request("/api/classes"))
    Rails.cache.write("dnd-classes", response)
    response
  end

  def connection
    Faraday.new("https://www.dnd5eapi.co")
  end

  def request(url)
    connection.get(url)
  end

  def parse_response(request)
    JSON.parse(request.body, symbolize_names: true)
  end
end
