# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.destroy_all
Game.destroy_all
Week.destroy_all
User.destroy_all

['Bears', 'Packers'].each do |name|
  Team.create(name: name)
end

game = Game.create(home_team_id: Team.first.id, away_team_id: Team.last.id)
week = Week.create(year: 2014, week_number: 1)

week.games << game

User.create(email: 'asdf@yahoo.com')
User.create(email: 'qwer@hotmail.com')

Pick.create(user_id: User.first.id, game_id: Game.first.id, home_team: true)
Pick.create(user_id: User.last.id,  game_id: Game.first.id, home_team: false)
