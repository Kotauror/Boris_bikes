class Bike

  attr_writer :working

  def initialize(working=true) #set the default working state to true
    @working = working
  end

  def working?
    return @working
  end

  def report
    if self.working?
      then return "Bike is working"
    else
      return "Bike is not working"
    end
  end

end
