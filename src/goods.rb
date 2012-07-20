class Goods
	attr_accessor :descriptions

	def initialize(descriptions)
		@descriptions = descriptions
	end

	def sales_taxes
		GoodParser.parse_goods(descriptions)["sales_taxes"]
	end

	def total_price
		GoodParser.parse_goods(descriptions)["total_price"]
	end	

	def print_output
		puts GoodParser.goods_output_result(descriptions)
	end

end