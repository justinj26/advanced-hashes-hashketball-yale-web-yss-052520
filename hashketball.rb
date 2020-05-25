# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here

def num_points_scored(player_name)
game_hash.each do |(key, value)|
  value[:players].find do |player|
    return player[:player_name] == player_name
  end
end 
end

def shoe_size(player_name)
game_hash.each do |(key, value)|
  value[:players].each do |player|
    if player[:player_name] == player_name
      return player[:shoe]
    end 
  end
end 
end

def team_colors(team_name)
  game_hash.each do |(key, value)|
    if value[:team_name] == team_name
    return value[:colors]
    end
  end
end 

def team_names
  team_array = []
  game_hash.each do |(key, value)|
    team_array << value[:team_name]
  end
  team_array
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |(key, value)|
    if value[:team_name] == team_name 
      value[:players].each do |element|
        jersey_numbers << element[:number]
      end 
    end
  end 
  jersey_numbers
end 

def player_stats(player_name)
  game_hash.each do |(key, value)|
    value[:players].each do |element|
      if element[:player_name] == player_name
        return element
      end 
    end
  end 
end

def big_shoe_rebounds
  shoe_sizes = []
  max_shoe = 0 
  game_hash.each do |(key, value)|
    value[:players].each do |element|
      shoe_sizes << element[:shoe]
    end
  end
  max_shoe = shoe_sizes.max 
  game_hash.each do |(key, value)|
   value[:players].each do |element|
      if element[:shoe] == max_shoe
        return element[:rebounds]
      end
    end
  end
end

def winning_team
  home_team_points = 0 
  away_team_points = 0 
  home_team_points = game_hash[:home].reduce(0) do |total, element|
    total = total + element[:players][:points] 
  end
  away_team_points = game_hash[:away].reduce do |total, element|
    total = total + element[:players][:points] 
  end
  if home_team_points > away_team_points
    return "Brooklyn Nets"
  else
    "Charlotte Hornets"
  end
end

#winning_team

def player_with_longest_name
  name_lengths = []
  max_name_length = 0 
  game_hash.each do |(key, value)|
    value[:players].each do |element|
      name_lengths << element[:player_name].length 
    end
  end
  max_name_length = name_lengths.max 
  game_hash.each do |(key, value)|
   value[:players].each do |element|
      if element[:player_name].length == max_name_length
        return element[:player_name]
      end
    end
  end
end

player_with_longest_name