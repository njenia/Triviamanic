class String
  def to_secs
    time = self.match /(\d*)/
    time_scale = self.match /(\D)/
    time = time[0].to_i
    case time_scale[0]
    when "m"
        time * 60
    when "h"
        time * 60 * 60
    end
  end
end

