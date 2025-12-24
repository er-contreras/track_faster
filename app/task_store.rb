require "json"
require "fileutils"

class TaskStore
  FILE_PATH = File.expand_path("../../data/tasks.json", __dir__)

  def all
    load_tasks
  end

  def add(title)
    tasks = load_tasks
    tasks << title
    persist!(tasks)
  end

  private

  def ensure_file!
    FileUtils.mkdir_p(File.dirname(FILE_PATH))
    File.write(FILE_PATH, "[]") unless File.exist?(FILE_PATH)
  end

  def load_tasks
    ensure_file!

    JSON.parse(File.read(FILE_PATH))
  rescue JSON::ParserError
    []
  end

  def persist!(tasks)
    File.write(FILE_PATH, JSON.pretty_generate(tasks))
  end
end

