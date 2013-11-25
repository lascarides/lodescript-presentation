class Loader

	DNZ_API_KEY = 'iaStyqKuqiBjgS7J6Td5'

	require 'json'
	require 'net/http'
	require 'open-uri'

	def self.get(url)
		if url =~ /digitalnz/
			id = url.gsub(/^.*records\/(\d+).*$/, '\1')
			dnz_find(id)
		elsif url =~ /teara.govt.nz/
			teara_find(url)
		elsif url =~ /ourheritage/
			ourheritage_find(url)
		elsif url =~ /mccahon.co.nz/
			mccahon_find(url)
		end
	end

	def self.dnz_find(id)
		url = "http://api.digitalnz.org/v3/records/#{id}.json?api_key=#{DNZ_API_KEY}"
		response = Net::HTTP.get_response(URI.parse(url)).body.force_encoding("UTF-8")
		result = JSON.parse(response)
		result['record']
	end

	def self.dnz_search_results(query)
		url = "http://api.digitalnz.org/v3/records.json?api_key=#{DNZ_API_KEY}&and[primary_collection][]=Papers+Past&text=#{CGI::escape(query)}"
		response = Net::HTTP.get_response(URI.parse(url)).body.force_encoding("UTF-8")
		result = JSON.parse(response)
	end

	def self.teara_find(url)
		result = {}
		article = Nokogiri::HTML(open(url))
		article.css("meta").each do |meta|
			meta = meta.to_s
			if meta =~ /name="DC\./
				key = meta.gsub(/^.*name="DC\.([^"]+)" content.*$/, '\1')
				val = meta.gsub(/^.*content="([^"]+)".*$/, '\1')
				result[key.strip] = ActionView::Base.full_sanitizer.sanitize(val.strip)
			end
		end
		result
	end

	def self.mccahon_find(url)
		result = {}
		article = Nokogiri::HTML(open(url))
		article.css("tr.even,tr.odd").each do |row|
			row = row.to_s.gsub("\n", '').gsub(/ +/, ' ').strip
			if row =~ /class="field/
				key = row.gsub(/^.*<tr class=".*"><td class="field">(.*)<\/td><td class="value">(.*)<\/td>.*$/, '\1')
				val = row.gsub(/^.*<tr class=".*"><td class="field">(.*)<\/td><td class="value">(.*)<\/td>.*$/, '\2')
				result[key.strip.downcase] = ActionView::Base.full_sanitizer.sanitize(val.strip)
			end
		end
		result
	end

	def self.ourheritage_find(url)
		result = {}
		article = Nokogiri::HTML(open(url))
		article.css(".element").each do |row|
			row = row.to_s.gsub("\n", '').gsub(/ +/, ' ').strip
			key = row.gsub(/^.*<h3>(.*)<\/h3>.*$/, '\1')
			val = row.gsub(/^.*<div class="element-text">(.*)<\/div>.*$/, '\1')
			result[key.strip.downcase] = ActionView::Base.full_sanitizer.sanitize(val.strip)
		end
		result
	end


end