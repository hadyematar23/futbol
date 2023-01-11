require 'spec_helper.rb'

RSpec.describe TeamUtility do
  let(:game_path) { './data/games_fixture.csv' }
  let(:team_path) { './data/teams_fixture.csv' }
  let(:game_teams_path) { './data/game_teams_fixture.csv' }
  let(:locations) do 
    {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
    }
  end
  it "finds all the game teams for that team_id" do 
    teamstats = double(teamstats)
    teamstats.extend(TeamUtility)
    
    gameteam1 = double("Game 1")
    gameteam2 = double("Game2")
    gameteam3 = double("Game3")

    allow(gameteam1).to receive(:team_id).and_return("8")
    allow(gameteam2).to receive(:team_id).and_return("12")
    allow(gameteam3).to receive(:team_id).and_return("8")
    
    allow(teamstats).to receive(:game_teams).and_return([gameteam1, gameteam2, gameteam3])
    
    expect(teamstats.find_relevant_game_teams_by_teamid("8")).to eq([gameteam1, gameteam3])

  end

  it "finds the team name when provided a team id" do 

    stat_tracker = StatTracker.from_csv(locations)
    teamstats = TeamStats.new(locations)
    
    expect(teamstats.team_name("6")).to eq("FC Dallas")

  end

end