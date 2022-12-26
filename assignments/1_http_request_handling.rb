require 'net/http'
require 'json'

uri = URI('https://rickandmortyapi.com/api/episode')
res = Net::HTTP.get_response(uri)

episodes = JSON.parse(res.body)['results'] if res.is_a?(Net::HTTPSuccess)

episodes.each do |episode|
  character_urls = episode['characters']

  character_urls.each_with_index do |character_url, index|
    character_object = Net::HTTP.get_response(URI(character_url))
    episode['characters'][index] = character_object.body if character_object.is_a?(Net::HTTPSuccess)
  end
end

puts 'modified episodes'
puts episodes.inspect
# episodes.each do |episode|
#   pp episode
#   puts ' '
# end
