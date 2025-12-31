require "pg"

class TaskStore
  DATABASE_URL = ENV.fetch("DATABASE_URL") do
    raise "DATABASE_URL is required but not set"
  end

  def initialize
    @conn = PG.connect(ENV.fetch("DATABASE_URL"))
    ensure_table!
  end

  def all
    @conn.exec("SELECT title FROM tasks ORDER BY id").map { |r| r["title"] }
  end

  def add(title)
    @conn.exec_params("INSERT INTO tasks (title) VALUES ($1)", [title])
  end

  private

  def ensure_table!
    @conn.exec <<~SQL
      CREATE TABLE IF NOT EXISTS tasks (
        id SERIAL PRIMARY KEY,
        title TEXT NOT NULL
      )
    SQL
  end
end
