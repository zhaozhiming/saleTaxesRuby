class GoodParser
	GoodParseRegex = /(\d+)\s((\w+\s)+)at\s(\d+(.\d+)?)/

	def self.parse_good(description)
		description.match(GoodParseRegex)
		{
			"name" => $2.rstrip,
			"price" => $4.to_f,
			"count" => $1.to_i
		}
	end

	def self.parse_goods(descriptions)
		sales_taxes = 0
		total_price = 0
		descriptions.split("\n").each do |description|
			good = Good.new(description)
			sales_taxes += good.tax
			total_price += good.price_after_tax
		end
		{ 
			"sales_taxes" => sales_taxes.round(2),
			"total_price" => total_price.round(2)
		}
	end

	def self.goods_output_result(descriptions)
		output = ""
		descriptions.split("\n").each do |description|
			good = Good.new(description)
			output += good.count.to_s + " " + good.name + ": " + good.price.to_s + "\n"
		end	
		output += "Sales Taxes: " + parse_goods(descriptions)["sales_taxes"].to_s + "\n"
		output += "Total: " + parse_goods(descriptions)["total_price"].to_s
	end

end