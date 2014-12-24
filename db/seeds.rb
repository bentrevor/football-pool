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
week.games = [
              Game.create(home_team_id: Team.find_by(name: 'Lions').id,      away_team_id: Team.find_by(name: 'Bears').id,     kickoff_time: Time.new(2014,11,27,11,30,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Cowboys').id,    away_team_id: Team.find_by(name: 'Eagles').id,    kickoff_time: Time.new(2014,11,27,15,30,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: '49ers').id,      away_team_id: Team.find_by(name: 'Seahawks').id,  kickoff_time: Time.new(2014,11,27,19,30,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Bills').id,      away_team_id: Team.find_by(name: 'Browns').id,    kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Ravens').id,     away_team_id: Team.find_by(name: 'Chargers').id,  kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Vikings').id,    away_team_id: Team.find_by(name: 'Panthers').id,  kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Buccaneers').id, away_team_id: Team.find_by(name: 'Bengals').id,   kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Texans').id,     away_team_id: Team.find_by(name: 'Titans').id,    kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Colts').id,      away_team_id: Team.find_by(name: 'Redskins').id,  kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Jaguars').id,    away_team_id: Team.find_by(name: 'Giants').id,    kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Steelers').id,   away_team_id: Team.find_by(name: 'Saints').id,    kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Rams').id,       away_team_id: Team.find_by(name: 'Raiders').id,   kickoff_time: Time.new(2014,11,30,12,00,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Falcons').id,    away_team_id: Team.find_by(name: 'Cardinals').id, kickoff_time: Time.new(2014,11,30,15,05,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Packers').id,    away_team_id: Team.find_by(name: 'Patriots').id,  kickoff_time: Time.new(2014,11,30,15,25,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Chiefs').id,     away_team_id: Team.find_by(name: 'Broncos').id,   kickoff_time: Time.new(2014,11,30,19,30,0,"+06:00")),
              Game.create(home_team_id: Team.find_by(name: 'Jets').id,       away_team_id: Team.find_by(name: 'Dolphins').id,  kickoff_time: Time.new(2014,12,01,19,30,0,"+06:00")),
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
