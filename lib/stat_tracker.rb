require 'csv'

class StatTracker 
    attr_reader :game_teams,
                :games,
                :teams

  def initialize(game_teams, games, teams)
    @game_teams = game_teams
    @games = games
    @teams = teams
  end

  def self.from_csv(locations)
    game_teams = game_teams_from_csv(locations)
    games = games_from_csv(locations)
    teams = teams_from_csv(locations)
    self.new(game_teams, games, teams)
  end

  def self.game_teams_from_csv(locations)
    game_teams_array = []
    CSV.foreach(locations[:game_teams], headers: true) do |info|
      info = info.to_h
      hash2= info.map do |value, key|
        [value.to_sym, key]
      end
      info = hash2.to_h
      game_teams_array << GameTeam.new(info)
    end
    game_teams_array
  end

  def self.games_from_csv(locations)
    games_array = []
    CSV.foreach(locations[:games], headers: true) do |info|
      info = info.to_h
      hash2= info.map do |value, key|
        [value.to_sym, key]
      end
      info = hash2.to_h
      games_array << Game.new(info)
    end
    games_array
  end

  def self.teams_from_csv(locations)
    teams_array = []
    CSV.foreach(locations[:teams], headers: true) do |info|
      info = info.to_h
      hash2= info.map do |value, key|
        [value.to_sym, key]
      end
      info = hash2.to_h
      teams_array << Team.new(info)
    end
    teams_array
  end
end