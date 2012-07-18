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
end