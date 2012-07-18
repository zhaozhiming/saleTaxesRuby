class GoodParser
	GoodParseRegex = /\d+\s((\w+\s)+)at\s(\d+(.\d+)?)/

	def self.parse_name(description)
		description.match(GoodParseRegex)
		$1.rstrip
	end

	def self.parse_price(description)
		description.match(GoodParseRegex)
		$3.to_f
	end

	def self.parse_goods(descriptions)
		descriptions.split("\n").each do |description|
			good_name = parse_name(description)
			good_price = parse_price(description)
		end
	end
end