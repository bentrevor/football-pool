class Team < ActiveRecord::Base
  has_many :picks

  def record
    if ties > 0
      "#{wins} - #{losses} - #{ties}"
    else
      "#{wins} - #{losses}"
    end
  end
end
