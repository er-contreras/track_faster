class TaskStore
  def initialize
    @tasks = []
  end

  def all
    @tasks
  end

  def add(title)
    @tasks << title
  end
end

