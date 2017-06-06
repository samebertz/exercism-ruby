class School
  def initialize
    @students = {}
  end
  def add(name, grade)
    @students[grade] ||= []
    @students[grade] << name
  end
  def students(grade)
    @students[grade] ||= []
    @students[grade].sort
  end
  def students_by_grade
    @students.to_a.sort.reduce([]) do |memo, grade|
      memo << {grade: grade[0], students: grade[1].sort}
    end
  end
end

module BookKeeping
  VERSION = 3
end
