class Team < ActiveRecord::Base
  def record
    if ties > 0
      "#{wins} - #{losses} - #{ties}"
    else
      "#{wins} - #{losses}"
    end
  end
end
