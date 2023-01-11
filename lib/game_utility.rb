module GameUtility 

  def determine_game_outcome(game, relevant_game_teams) 
    relevant_game_teams.each do |game_team|
      if game_team.game_id == game.game_id
        return game_team.result 
      end
    end
  end
  
end