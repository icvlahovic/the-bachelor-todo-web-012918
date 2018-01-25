def get_first_name_of_season_winner(data, season)
  data[season].map do |contestant_hash|
    if contestant_hash["status"].downcase == "winner"
      return contestant_hash["name"].split.first
    end
  end
end

def get_contestant_name(data, occupation)
  data.map do |season, contestants|
    contestants.map do |contestant_hash|
      if contestant_hash["occupation"] == occupation
        return contestant_hash["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  total = 0
  data.map do |season, contestants|
    contestants.map do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        total += 1
      end
    end
  end
  total
end

def get_occupation(data, hometown)
  data.each do |season, contestants|
    contestants.each do |contestant_hash|
      if contestant_hash["hometown"] == hometown
        return contestant_hash["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  season_age_total = 0
  number_of_contestants = 0
  data[season].each do |contestants|
    season_age_total += (contestants["age"]).to_f
    number_of_contestants += 1
  end
  (season_age_total / number_of_contestants).round
end
