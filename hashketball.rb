# Write your code here!

require "pry"

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  # if game_hash[:home][:players].include?(player)
  #   return game_hash[:home][:players][player][:points]
  # elsif game_hash[:away][:players].include?(player)
  #   return game_hash[:away][:players][player][:points]
  # else
  #   return nil
  # end
  
  game_hash.each do |key, value|
    value.each do |key1, value1|
      if key1 == :players
        value1.each do |key2, value2|
          if key2 == player
            return value2[:points]
          end
        end
      end
    end
  end
  
end

def shoe_size(player)
  # if game_hash[:home][:players].include?(player)
  #   return game_hash[:home][:players][player][:shoe]
  # elsif game_hash[:away][:players].include?(player)
  #   return game_hash[:away][:players][player][:shoe]
  # else
  #   return nil
  # end
  
  game_hash.each do |key, value|
    value.each do |key1, value1|
      if key1 == :players
        value1.each do |key2, value2|
          if key2 == player
            return value2[:shoe]
          end
        end
      end
    end
  end
  
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team_name
    return game_hash[:away][:colors]
  else
    return nil
  end
end

def team_names
  [
    game_hash[:home][:team_name],
    game_hash[:away][:team_name]
  ]
end

def player_numbers(team_name)
  result = Array.new
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |player, stats|
      result << stats[:number]
    end
    return result
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |player, stats|
      result << stats[:number]
    end
    return result
  else
    return nil
  end
end

def player_stats(player)
  if game_hash[:home][:players].include?(player)
    return game_hash[:home][:players][player]
  elsif game_hash[:away][:players].include?(player)
    return game_hash[:away][:players][player]
  else
    return nil
  end
end

def big_shoe_rebounds
  # {:shoe => , :rebounds => }
  result = Array.new
  game_hash[:home][:players].each do |player, stats|
    result << {
      :shoe => stats[:shoe],
      :rebounds => stats[:rebounds]
    }
  end
  game_hash[:away][:players].each do |player, stats|
    result << {
      :shoe => stats[:shoe],
      :rebounds => stats[:rebounds]
    }
  end
  target = 0
  for i in (1...result.length) do
    if result[i][:shoe] > result[target][:shoe]
      target = i
    end
  end
  result[target][:rebounds]
end

