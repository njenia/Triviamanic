class Integer
  def to_pretty_time_str
    if self / 60 == 0
      return self.to_s + "s"
    elsif (self / 60).between?(1, 59)
      (self / 60).to_s + "m"
    else
      (self / 60 / 60).to_s + "h"
    end
  end
end

