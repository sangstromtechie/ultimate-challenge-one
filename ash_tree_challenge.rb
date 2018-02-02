require 'net/http'
require 'json'
require 'pp'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?$limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)

trees = JSON.parse(response)

ash_trees = 0

trees.each do |tree|
  if tree["common_name"].include? "ash"
    ash_trees += 1
  end
end

puts "There are #{ash_trees} ash trees in Winnipeg."