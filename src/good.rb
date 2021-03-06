
class Good
	attr_accessor :description

	GoodParseRegex = /(\d+)\s((\w+\s)+)at\s(\d+(.\d+)?)/
	ExemptionGoods = Array["book", "chocolate", "pill"]
	TaxNeastUnit = 0.05
	ImportedTaxFactor = 0.05
	BaseTaxFactor = 0.1

	def initialize(description)
		@description = description
	end

	def name
		parse["name"]
	end

	def price
		parse["price"]
	end

	def count
		parse["count"]
	end

	def is_imported
		name.include?"imported"
	end

	def is_exempt
		good_name = name 
		exempt = false
		ExemptionGoods.each{|item| exempt ||= good_name.include?item}
		exempt
	end

	def tax
		tax_factor = is_imported ? ImportedTaxFactor : 0
		tax_factor += is_exempt ? 0 : BaseTaxFactor

		tax = (price * tax_factor)

		tax_mod = tax % TaxNeastUnit
		tax = (tax_mod == 0) ? tax : tax + (TaxNeastUnit - tax_mod)
		tax = tax.round(2)
	end

	def price_after_tax
		(price + tax).round(2)
	end

	private 
		def parse
			@description.match(GoodParseRegex)
			{
				"name" => $2.rstrip,
				"price" => $4.to_f,
				"count" => $1.to_i
			}
		end

end