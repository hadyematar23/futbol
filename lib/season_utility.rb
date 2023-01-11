module SeasonUtility

  def all_games_by_season
    @all_games_by_season ||= games.group_by { |game| game.season } 
  end

  def list_gameteams_from_particular_season(season)
    games_in_season = all_games_by_season[season]
    require 'pry'; binding.pry
    pull_gameids = games_in_season.map {|game| game.game_id} 

    pull_gameids.flat_map do |game_id|
      game_teams.find_all {|game_team| game_id == game_team.game_id}
    end
  end 

end