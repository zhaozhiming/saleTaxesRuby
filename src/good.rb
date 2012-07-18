
class Good
	attr_accessor :description

	ExemptionGoods = Array["book", "chocolate", "pill"]
	TaxNeastUnit = 0.05
	ImportedTaxFactor = 0.05
	UnExemptTaxFactor = 0.1

	def initialize(description)
		@description = description
	end

	def name
		GoodParser.parse_name(@description)
	end

	def price
		GoodParser.parse_price(@description)
	end

	def imported
		name.include?"imported"
	end

	def exempt
		exempt = false
		ExemptionGoods.each{|item| exempt ||= name.include?item}
		exempt
	end

	def tax_calc
		tax_factor = imported ? ImportedTaxFactor : 0
		tax_factor += exempt ? 0 : UnExemptTaxFactor

		tax = (price * tax_factor)

		tax_mod = tax % TaxNeastUnit
		tax = (tax_mod == 0) ? tax : tax + (TaxNeastUnit - tax_mod)
		tax = tax.round(2)
	end

	def price_after_tax
		tax = tax_calc
		(price + tax).round(2)
	end
end