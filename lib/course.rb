# ## Course
# * `Course#initialize` should take the course name, department, and
#   number of credits.
# * `Course#students` should return a list of the enrolled students.
# * `Course#add_student` should add a student to the class.
#   * Probably can rely upon `Student#enroll`.

# ## And some extras:
# * Each course should also take a set of days of the week (`:mon`,
#   `:tue`, ...), plus a time block (assume each day is broken into 8
#   consecutive time blocks). So a course could meet
#   `[:mon, :wed, :fri]` during block #1.
#     * Update your `#initialize` method to also take a time block and
#       days of the week.
# * Write a method `Course#conflicts_with?` which takes a second
#   `Course` and returns true if they conflict.
# * Update `Student#enroll` so that you raise an error if a `Student`
#   enrolls in a new course that conflicts with an existing course time.
#     * May want to write a `Student#has_conflict?` method to help.

class Course
    attr_accessor :students, :days, :time_block
    attr_reader :name, :department, :credits

    def initialize (name, department, credits, days, time_block)
        @name = name
        @department = department
        @credits = credits
        @students = []
        @days = days
        @time_block = time_block
    end

    def add_student(student)
        student.enroll(self)
    end

    def conflicts_with?(course)
        if course.time_block == @time_block
            @days.each do |el|
                return true if course.days.include?(el)
            end
        end
        false
    end
end
