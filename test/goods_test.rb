require "../src/good"
require "../src/goods"
require "test/unit"

class GoodsTest < Test::Unit::TestCase

def test_should_get_goods_sales_taxes_and_total_price_when_given_descriptions
		group_one_goods = Goods.new("1 book at 12.49
																1 music CD at 14.99
																1 chocolate bar at 0.85")
		assert_equal(1.5, group_one_goods.sales_taxes)
		assert_equal(29.83, group_one_goods.total_price)	
		expect_output_one = "1 book: 12.49
												1 music CD: 16.49
												1 chocolate bar: 0.85
												Sales Taxes: 1.50
												Total: 29.83"
		assert_equal(expect_output_one.gsub(/\s+/,""), group_one_goods.output_result.gsub(/\s+/,""))

		group_two_goods = Goods.new("1 imported box of chocolates at 10.00
																1 imported bottle of perfume at 47.50")
		assert_equal(7.65, group_two_goods.sales_taxes)
		assert_equal(65.15, group_two_goods.total_price)	
		expect_output_two = "1 imported box of chocolates: 10.50
												1 imported bottle of perfume: 54.65
												Sales Taxes: 7.65
												Total: 65.15"
		assert_equal(expect_output_two.gsub(/\s+/,""), group_two_goods.output_result.gsub(/\s+/,""))

		group_three_goods = Goods.new("1 imported bottle of perfume at 27.99
																	1 bottle of perfume at 18.99
																	1 packet of headache pills at 9.75
																	1 box of imported chocolates at 11.25")
		assert_equal(6.70, group_three_goods.sales_taxes)
		assert_equal(74.68, group_three_goods.total_price)
		expect_output_three = "1 imported bottle of perfume: 32.19
													1 bottle of perfume: 20.89
													1 packet of headache pills: 9.75
													1 box of imported chocolates: 11.85
													Sales Taxes: 6.70
													Total: 74.68"
		assert_equal(expect_output_three.gsub(/\s+/,""), group_three_goods.output_result.gsub(/\s+/,""))

	end	
end
