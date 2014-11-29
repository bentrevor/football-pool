# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Chicago Bears', 'Green Bay Packers'].each do |name|
  Team.create(name: name)
end

game = Game.create(home_team_id: Team.first.id, away_team_id: Team.last.id)
week = Week.create(year: 2014, week_number: 1)

week.games << game

User.create(email: 'asdf@yahoo.com')
User.create(email: 'qwer@hotmail.com')
