require 'spec_helper.rb'

RSpec.describe GoalsUtility do

  it "will return a hash with away and home as the keys and gameteams as the values, based on whether it's home or away" do 

    league_stats = double("League")
    league_stats.extend(GoalsUtility)

    gameteam1 = double("Gameteam1")
    gameteam2 = double("Gameteam2")
    gameteam3 = double("Gameteam3")

    allow(gameteam1).to receive(:hoa).and_return("away")
    allow(gameteam2).to receive(:hoa).and_return("away")
    allow(gameteam3).to receive(:hoa).and_return("home")

    allow(league_stats).to receive(:game_teams).and_return([gameteam1, gameteam2, gameteam3])

    expect(league_stats.hoa_all_game_teams).to eq({
      "away" => [gameteam1, gameteam2], 
      "home" => [gameteam3]
    })
  end

  it "creates a hash with the team id as a key and as the value, the number of goals as a float" do 

    league_stats = double("League")
    league_stats.extend(GoalsUtility)

    gameteam1 = double("Gameteam1")
    gameteam2 = double("Gameteam2")
    gameteam3 = double("Gameteam3")
    gameteam4 = double("Gameteam3")
    gameteam5 = double("Gameteam3")


    allow(gameteam1).to receive(:team_id).and_return("55")
    allow(gameteam2).to receive(:team_id).and_return("55")
    allow(gameteam3).to receive(:team_id).and_return("55")
    allow(gameteam4).to receive(:team_id).and_return("99")
    allow(gameteam5).to receive(:team_id).and_return("99")

    allow(gameteam1).to receive(:goals).and_return(1)
    allow(gameteam2).to receive(:goals).and_return(2)
    allow(gameteam3).to receive(:goals).and_return(3)
    allow(gameteam4).to receive(:goals).and_return(4)
    allow(gameteam5).to receive(:goals).and_return(6)

    allow(league_stats).to receive(:game_teams).and_return([gameteam1, gameteam2, gameteam3, gameteam4, gameteam5])

    expect(league_stats.team_id_all_goals).to eq({
      "55" => [1.0, 2.0, 3.0], 
      "99" => [4.0, 6.0]
    })
  end

  it "sums up the home and away goals" do 

    game_stats = double("GameStats")
    game_stats.extend(GoalsUtility)

    game1 = double("Game1")
    game2 = double("Game2")
    game3 = double("Game3")

    allow(game1).to receive(:home_goals).and_return(1)
    allow(game2).to receive(:home_goals).and_return(2)
    allow(game3).to receive(:home_goals).and_return(1)

    allow(game1).to receive(:away_goals).and_return(3)
    allow(game2).to receive(:away_goals).and_return(4)
    allow(game3).to receive(:away_goals).and_return(2)

    allow(game_stats).to receive(:games).and_return([game1, game2, game3])

    expect(game_stats.sums_of_home_away_goals).to eq([4, 6, 3])
  end

end