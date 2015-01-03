class Team < ActiveRecord::Base
  def record
    if ties > 0
      "#{wins} - #{losses} - #{ties}"
    else
      "#{wins} - #{losses}"
    end
  end

  def self.[](name)
    team = find_by_name(name)
  end
end
