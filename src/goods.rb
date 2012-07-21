class Goods
	attr_accessor :descriptions

	def initialize(descriptions)
		@descriptions = descriptions
	end

	def sales_taxes
		parse["sales_taxes"]
	end

	def total_price
		parse["total_price"]
	end	

	def print_output
		puts get_goods_output_result
	end

	private

		def parse
			sales_taxes = 0
			total_price = 0
			@descriptions.split("\n").each do |description|
				good = Good.new(description)
				sales_taxes += good.tax
				total_price += good.price_after_tax
			end
			{ 
				"sales_taxes" => sales_taxes.round(2),
				"total_price" => total_price.round(2)
			}
		end

	def get_goods_output_result
		output = ""
		@descriptions.split("\n").each do |description|
			good = Good.new(description)
			output += good.count.to_s + " " + good.name + ": " + good.price.to_s + "\n"
		end	
		output += "Sales Taxes: " + parse["sales_taxes"].to_s + "\n"
		output += "Total: " + parse["total_price"].to_s
	end
end