require "rack"
require_relative "task_store"

class App
  def initialize
    @tasks = TaskStore.new
  end

  def call(env)
    request = Rack::Request.new(env)

    case request.path
    when "/"
      html_response(render_index)
    when "/tasks"
      handle_tasks(request)
    else
      not_found
    end
  end

  private

  def render_index
    <<~HTML
      <!doctype html>
      <html>
        <head>
          <meta charset="utf-8">
          <title>Task App</title>
          <link rel="stylesheet" href="/styles.css">
          <script src="/app.js"></script>
        </head>
        <body>
          <h1>Execute projects step by step</h1>

          <form method="POST" action="/tasks">
            <input type="text" name="title" required>
            <button>Add task</button>
          </form>

          <ul>
            #{render_items}
          </ul>
        </body>
      </html>
    HTML
  end

  def handle_tasks(request)
    return not_found unless request.post?
  
    title = request.params["title"]&.strip
    return bad_request if title.nil? || title.empty?
  
    @tasks.add(title)

    [200, { "content-type" => "text/html" }, ["<li>#{Rack::Utils.escape_html(title)}</li>"]]
  end

  def render_items
    @tasks.all.map do |title|
      "<li>#{Rack::Utils.escape_html(title)}</li>"
    end.join
  end

  def html_response(body)
    [200, { "content-type" => "text/html" }, [body]]
  end

  def redirect_to(path)
    [302, { "location" => path }, []]
  end

  def not_found
    [404, { "content-type" => "text/plain" }, ["Not Found"]]
  end
end
