require 'net/http'
require 'json'
require 'pp'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)

dogs = JSON.parse(response)

dogs["message"].each do |dog, breed|
  if breed == []
    dog_info = dog
  else
    breed.each do |sub_breed|
      dog_info = "#{sub_breed} #{dog}"
    end
  end
  puts dog_info
end