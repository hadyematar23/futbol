require 'spec_helper.rb'

RSpec.describe GameUtility do

  it "when input with a game and the list of various game_teams that have been filtered by team_id so as to prevent duplicates, it returns the result of the game_team (what happened in the game)" do 
    teamstats = double
    teamstats.extend(GameUtility)

    gamearg = double("game")
    allow(gamearg).to receive(:game_id).and_return(25)

    gameteam1 = double("gameteam1")
    gameteam2 = double("gameteam2")
    gameteam3 = double("gameteam3")

    allow(gameteam1).to receive(:game_id).and_return(30)
    allow(gameteam2).to receive(:game_id).and_return(45)
    allow(gameteam3).to receive(:game_id).and_return(25)

    allow(gameteam1).to receive(:result).and_return("LOSS")
    allow(gameteam2).to receive(:result).and_return("LOSS")
    allow(gameteam3).to receive(:result).and_return("WIN")
    
    game = gamearg
    relevant_game_teams = [gameteam1, gameteam2, gameteam3]

    expect(teamstats.determine_game_outcome(game, relevant_game_teams)).to eq("WIN")

  end


end