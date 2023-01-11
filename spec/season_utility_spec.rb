require 'spec_helper.rb'

RSpec.describe SeasonUtility do

  it "can determine all the games by season" do 
    seasonstats = double
    seasonstats.extend(SeasonUtility)

    game1 = double
    game2 = double
    game3 = double
    game4 = double 

    allow(game1).to receive(:season).and_return("2012")
    allow(game2).to receive(:season).and_return("2012")
    allow(game3).to receive(:season).and_return("2018")
    allow(game4).to receive(:season).and_return("2013")


    allow(seasonstats).to receive(:games).and_return([game1, game2, game3, game4])

    expect(seasonstats.all_games_by_season).to eq({
      "2012" => [game1, game2], 
      "2013" => [game4], 
      "2018" => [game3]
    })
  end 

  it "can list the gametimes in a particular season" do 
    seasonstats = double
    seasonstats.extend(SeasonUtility)

    gameteam1 = double
    gameteam2 = double
    gameteam3 = double
    gameteam4 = double

    game1 = double
    game2 = double
    game3 = double
    game4 = double 

    allow(game1).to receive(:game_id).and_return(23)
    allow(game2).to receive(:game_id).and_return(34)
    allow(game3).to receive(:game_id).and_return(45)
    allow(game4).to receive(:game_id).and_return(67)

    allow(gameteam1).to receive(:game_id).and_return(23)
    allow(gameteam2).to receive(:game_id).and_return(99)
    allow(gameteam3).to receive(:game_id).and_return(45)
    allow(gameteam4).to receive(:game_id).and_return(20)

    hash = {"2012" => [game1, game2, game3, game4]}

    allow(seasonstats).to receive(:all_games_by_season).and_return(hash)

    allow(seasonstats).to receive(:game_teams).and_return([gameteam1, gameteam2, gameteam3, gameteam4])


    expect(seasonstats.list_gameteams_from_particular_season("2012")).to eq([gameteam1, gameteam3])

  end
end 