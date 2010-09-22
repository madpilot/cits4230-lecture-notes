class Lesson
  def name
    'lesson'
   end
end

class CompSci < Lesson
  def name
    return "Comp Sci " + super
  end
end

c = CompSci.new
puts c.name
