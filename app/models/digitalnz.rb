class DigitalNZ

	DNZ_API_KEY = 'iaStyqKuqiBjgS7J6Td5'

	require 'rubygems'
	require 'nokogiri'
	require 'json'
	require 'net/http'
	require 'open-uri'

	def self.find(id)
		url = "http://api.digitalnz.org/v3/records/#{id}.json?api_key=#{DNZ_API_KEY}"
		response = Net::HTTP.get_response(URI.parse(url)).body.force_encoding("UTF-8")
		result = JSON.parse(response)
		result['record']
	end

	def self.search_results(query)
		url = "http://api.digitalnz.org/v3/records.json?api_key=#{DNZ_API_KEY}&and[primary_collection][]=Papers+Past&text=#{CGI::escape(query)}"
		response = Net::HTTP.get_response(URI.parse(url)).body.force_encoding("UTF-8")
		result = JSON.parse(response)
	end

end