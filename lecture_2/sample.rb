class Sample
  def initialize
    @instance_variable = "I'm an instance variable!"
  end

  def instance_method
    return "I'm an instance method!"
  end

  def self.class_method
    return "I'm a class method!"
  end

protected
  def protected_instance_method
    return "I'm a protected instance method!"
  end
  
  def self.protected_class_method
    return "I'm a protected class method!"
  end

private
  def private_instance_method
    return "I'm a private instance method!"
  end
  
  def self.private_class_method
    return "I'm a private class method!"
  end
end

class SampleChild < Sample
  def call_protected
    self.protected_instance_method
  end

  def call_private
    self.private_instance_method
  end

  def instance_variable
    @instance_variable
  end

  def instance_variable=(instance_variable)
    @instance_variable = instance_variable
  end
end
