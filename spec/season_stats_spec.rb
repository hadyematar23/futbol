require 'csv'
require 'spec_helper'

RSpec.describe SeasonStats do
  let(:game_path) { './data/games.csv' }
  let(:team_path) { './data/teams_fixture.csv' }
  let(:game_teams_path) { './data/game_teams_fixture.csv' }
  let(:locations) do 
    {
    games: game_path,
    teams: team_path,
    game_teams: game_teams_path
    }
  end
  let(:stat_tracker) { StatTracker.from_csv(locations) }
  let(:season_stats) { SeasonStats.new(locations) }

  describe "#initialize" do
    it "exists" do 
      expect(season_stats).to be_instance_of(SeasonStats)
    end
  end

  describe "winningest/worst coach" do 
    it "winningest_coach" do 
      expect(season_stats.winningest_coach("20152016")).to eq("Ken Hitchcock")
      expect(season_stats.winningest_coach("20122013")).to eq("Alain Vigneault")
      expect(season_stats.winningest_coach("20172018")).to eq("Peter Laviolette").or(eq("Gerard Gallant")).or(eq("Paul Maurice"))
    end

    it "worst coach" do
      expect(season_stats.worst_coach("20152016")).to eq("Peter Laviolette").or(eq("Barry Trotz")).or(eq("Dave Hakstol")).or(eq("Michael Therrien")).or(eq("Alain Vigneault")).or(eq("Lindy Ruff"))
      expect(season_stats.worst_coach("20172018")).to eq("Glen Gulutzan").or(eq("Peter DeBoer")).or(eq("Mike Sullivan")).or(eq("Dave Hakstol")).or(eq("Alain Vigneault")).or(eq("Jon Cooper"))
    end
  end

  describe "most/least accurate team" do 

    it "#most_accurate_team" do
      expect(season_stats.most_accurate_team("20142015")).to eq("Portland Thorns FC")
      expect(season_stats.most_accurate_team("20172018")).to eq("Portland Thorns FC")
    end
    
    it "#least_accurate_team" do
      expect(season_stats.least_accurate_team("20142015")).to eq("Portland Timbers")
      expect(season_stats.least_accurate_team("20172018")).to eq("Sporting Kansas City")
    end
  end

  describe "most/fewest tackles" do
    it "#most_tackles" do
      expect(season_stats.most_tackles("20122013")).to eq("FC Dallas")
      expect(season_stats.most_tackles("20132014")).to eq("Houston Dynamo")
    end
    
    it "#fewest_tackles" do
      expect(season_stats.fewest_tackles("20122013")).to eq("Montreal Impact")
      expect(season_stats.fewest_tackles("20132014")).to eq("Los Angeles FC")
    end
  end
  
  describe "helper methods" do 
  
  it "can determine the coach name as as key, and the value is an array with the first number being the victories and the second number being the total games coached" do 

    
    gameteam1 = double("1")
    gameteam2 = double("2")
    gameteam3 = double("3")

    
    allow(gameteam1).to receive(:head_coach).and_return("Phil Jackson")
    allow(gameteam2).to receive(:head_coach).and_return("Doc Rivers")
    allow(gameteam3).to receive(:head_coach).and_return("Doc Rivers")

    allow(gameteam1).to receive(:result).and_return("WIN")
    allow(gameteam2).to receive(:result).and_return("LOSS")
    allow(gameteam3).to receive(:result).and_return("LOSS")

    games_in_season = [gameteam1, gameteam2, gameteam3]

    expect(season_stats.coach_victory_percentage_hash(games_in_season)).to eq({
      "Phil Jackson" => [1, 1], 
      "Doc Rivers" => [0, 2]
    })
  end

end

end
