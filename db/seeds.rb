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

team_names = %w[
Bears
Packers
Lions
Vikings

Falcons
Panthers
Saints
Buccaneers

Cowboys
Giants
Eagles
Redskins

Cardinals
49ers
Seahawks
Rams

Ravens
Bengals
Browns
Steelers

Texans
Colts
Jaguars
Titans

Bills
Dolphins
Patriots
Jets

Broncos
Chiefs
Raiders
Chargers
]

team_names.each do |name|
  Team.create(name: name)
end

week = Week.create(year: 2014, week_number: 13)
week13.games = [
              Game.between('Bears', 'Lions',        Time.new(2014,11,27,11,30,0,"+06:00")),
              Game.between('Eagles', 'Cowboys',     Time.new(2014,11,27,15,30,0,"+06:00")),
              Game.between('Seahawks', '49ers',     Time.new(2014,11,27,19,30,0,"+06:00")),
              Game.between('Browns', 'Bills',       Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Chargers', 'Ravens',    Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Panthers', 'Vikings',   Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Bengals', 'Buccaneers', Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Titans', 'Texans',      Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Redskins', 'Colts',     Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Giants', 'Jaguars',     Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Saints', 'Steelers',    Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Raiders', 'Rams',       Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.between('Cardinals', 'Falcons',  Time.new(2014,11,30,15,05,0,"+06:00")),
              Game.between('Patriots', 'Packers',   Time.new(2014,11,30,15,25,0,"+06:00")),
              Game.between('Broncos', 'Chiefs',     Time.new(2014,11,30,19,30,0,"+06:00")),
              Game.between('Dolphins', 'Jets',      Time.new(2014,12,01,19,30,0,"+06:00")),
             ]

User.create(name: 'A & AJ')
User.create(name: 'Alx/Lh')
User.create(name: 'Ann')
User.create(name: 'Anthony')
User.create(name: 'Barb')
User.create(name: 'Ben T')
User.create(name: 'Bruce')
User.create(name: 'Charles')
User.create(name: 'Danny')
User.create(name: 'Don')
User.create(name: 'Jacob')
User.create(name: 'Kim/Jon')
User.create(name: 'Kristina')
User.create(name: 'Mary Z')
User.create(name: 'Matt')
User.create(name: 'Michael')
User.create(name: 'Paul')
User.create(name: 'Sarah')
User.create(name: 'Tommy')
User.create(name: 'Vince')
User.create(name: 'Zak Fam')
