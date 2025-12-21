class App
  def call(env)
    request = Rack::Request.new(env)

    if request.path == "/"
      return html_response(render_index)
    end

    not_found
  end

  private

  def render_index
    steps = [
      { title: "Define project scope", done: false },
      { title: "Build execution loop", done: false },
      { title: "Ship MVP", done: false }
    ]

    items = steps.map do |step|
      "<li>#{step[:title]}</li>"
    end.join

    <<~HTML
      <!doctype html>
      <html>
        <head>
          <meta charset="utf-8">
          <title>Task App</title>
          <link rel="stylesheet" href="/styles.css">
        </head>
        <body>
          <h1>Execute projects step by step</h1>
          <ul>
            #{items}
          </ul>
        </body>
      </html>
    HTML
  end

  def html_response(body)
    [200, { "content-type" => "text/html" }, [body]]
  end

  def not_found
    [404, { "content-type" => "text/plain" }, ["Not Found"]]
  end
end

