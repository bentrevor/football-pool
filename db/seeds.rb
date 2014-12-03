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

don      = User.create(name: 'Don')
zak_fam  = User.create(name: 'Zak Fam')
mary_z   = User.create(name: 'Mary Z')
tommy    = User.create(name: 'Tommy')
paul     = User.create(name: 'Paul')
charles  = User.create(name: 'Charles')
michael  = User.create(name: 'Michael')
ben_t    = User.create(name: 'Ben T')
danny    = User.create(name: 'Danny')
bruce    = User.create(name: 'Bruce')
barb     = User.create(name: 'Barb')
alx_lh   = User.create(name: 'Alx/Lh')
sarah    = User.create(name: 'Sarah')
ann      = User.create(name: 'Ann')
a_aj     = User.create(name: 'A & AJ')
kristina = User.create(name: 'Kristina')
anthony  = User.create(name: 'Anthony')
kim_jon  = User.create(name: 'Kim/Jon')
jacob    = User.create(name: 'Jacob')
matt     = User.create(name: 'Matt')
vince    = User.create(name: 'Vince')

Pick.create(user_id: User.first.id, game_id: Game.first.id, is_home_team: true)
Pick.create(user_id: User.last.id,  game_id: Game.first.id, is_home_team: false)
