require 'net/http'
require 'json'

episodes = []
characters_store = {}

rick_and_morty_host = URI('https://rickandmortyapi.com/api/').host

Net::HTTP.start(rick_and_morty_host, use_ssl: true) do |http|
  episodes_uri = URI('https://rickandmortyapi.com/api/episode')
  until episodes_uri.nil?
    episodes_request = Net::HTTP::Get.new episodes_uri
    episodes_response = http.request episodes_request
    if episodes_response.is_a?(Net::HTTPSuccess)
      (JSON.parse(episodes_response.body)['results']).each do |episode_obj|
        episodes.append(episode_obj)
      end
    end
    next_page = JSON.parse(episodes_response.body)['info']['next']
    episodes_uri = next_page.nil? ? nil : URI(next_page)
  end

  episodes.each do |episode|
    character_urls = episode['characters']

    character_urls.each_with_index do |character_url, index|
      unless characters_store.has_key?(character_url)
        character_request = Net::HTTP::Get.new URI(character_url)
        character_object = http.request character_request
        characters_store[character_url] = character_object.body if character_object.is_a?(Net::HTTPSuccess)
      end

      episode['characters'][index] = characters_store[character_url]
    end
  end
end

puts 'modified episodes'
puts episodes.inspect
# episodes.each do |episode|
#   pp episode
#   puts ' '
# end
