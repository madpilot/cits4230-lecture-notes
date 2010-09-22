# We will use method_missing to implement a method called :you and :me
class SmokeyTheBear
  def method_missing(symbol, *args)
    responses = [ :me, :you ]
    
    if responses.include?(symbol)
      what_was_said = symbol.to_s
      what_was_meant = (symbol == :me ? 'you' : 'me')
      return "You chose '#{what_was_said}' referring to '#{what_was_meant}'. That is incorrect. The correct answer is '#{what_was_meant}'."
    else
      super
    end
  end
end

bear = SmokeyTheBear.new
puts bear.you
puts bear.me
puts bear.maggie
