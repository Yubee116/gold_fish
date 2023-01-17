require 'net/http'
require 'json'

episodes = []
characters_store = {}

rick_and_morty_host = URI('https://rickandmortyapi.com/api/').host

Net::HTTP.start(rick_and_morty_host, use_ssl: true) do |http|
  # Get count of episodes
  episodes_request = Net::HTTP::Get.new URI('https://rickandmortyapi.com/api/episode')
  episodes_response = http.request episodes_request
  episode_count = JSON.parse(episodes_response.body)['info']['count'] if episodes_response.is_a?(Net::HTTPSuccess)

  # Get all episodes
  all_episodes = (1..episode_count).to_a.join(',')
  episodes_request = Net::HTTP::Get.new URI("https://rickandmortyapi.com/api/episode/#{all_episodes}")
  episodes_response = http.request episodes_request
  episodes = JSON.parse(episodes_response.body) if episodes_response.is_a?(Net::HTTPSuccess)

  # Get count of characters
  characters_request = Net::HTTP::Get.new URI('https://rickandmortyapi.com/api/character')
  characters_response = http.request characters_request
  character_count = JSON.parse(characters_response.body)['info']['count'] if characters_response.is_a?(Net::HTTPSuccess)

  # Get all characters
  all_characters = (1..character_count).to_a.join(',')
  characters_request = Net::HTTP::Get.new URI("https://rickandmortyapi.com/api/character/#{all_characters}")
  characters_response = http.request characters_request
  characters = JSON.parse(characters_response.body) if characters_response.is_a?(Net::HTTPSuccess)

  characters.each do |character|
    characters_store[character['url']] = character
  end
end

# for each episode
# replace each character url with its corresponding character object
episodes.each do |episode|
  character_urls = episode['characters']

  character_urls.each_with_index do |character_url, index|
    unless characters_store.has_key?(character_url)
      puts 'well... that\'s strange'
      character_object = Net::HTTP.get_response(URI(character_url))
      characters_store[character_url] = character_object.body if character_object.is_a?(Net::HTTPSuccess)
    end

    episode['characters'][index] = characters_store[character_url]
  end
end

puts 'modified episodes'
puts episodes.inspect
# episodes.each do |episode|
#   pp episode
#   puts ' '
# end
