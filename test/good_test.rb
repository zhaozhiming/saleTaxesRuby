require "../src/good"
require "../src/good_parser"
require "test/unit"

class GoodTest < Test::Unit::TestCase

	def test_should_return_name_when_given_good_description
		assert_equal("book", Good.new("1 book at 12.49").name)
		assert_equal("music CD", Good.new("1 music CD at 14.99").name)
		assert_equal("imported box of chocolates", Good.new("1 imported box of chocolates at 10.00").name)
	end

	def test_should_return_price_when_given_good_description
		assert_equal(12.49, Good.new("1 book at 12.49").price)
		assert_equal(14, Good.new("1 music CD at 14").price)
	end

	def test_should_return_import_flag_when_given_good_description
		assert_equal(false, Good.new("1 book at 12.49").is_imported)
		assert_equal(true, Good.new("1 imported box of chocolates at 10.00").is_imported)
	end

	def test_should_return_exempt_flag_when_given_good_description
		assert_equal(true, Good.new("1 book at 12.49").is_exempt)
		assert_equal(true, Good.new("1 box of chocolates at 14").is_exempt)
		assert_equal(false, Good.new("1 music CD at 14").is_exempt)
	end
	
	def test_should_calc_tax_and_total_price_when_given_good_description
		assert_equal(0, Good.new("1 book at 12.49").tax)
		assert_equal(12.49, Good.new("1 book at 12.49").price_after_tax)
		assert_equal(1.5, Good.new("1 music CD at 14.99").tax)
		assert_equal(16.49, Good.new("1 music CD at 14.99").price_after_tax)
	end

	def test_should_calc_tax_and_total_price_when_given_good_description
		assert_equal(12.49, Good.new("1 book at 12.49").price_after_tax)
		assert_equal(0, Good.new("1 book at 12.49").tax)
		assert_equal(16.49, Good.new("1 music CD at 14.99").price_after_tax)
		assert_equal(1.5, Good.new("1 music CD at 14.99").tax)
		assert_equal(0.85, Good.new("1 chocolate bar at 0.85").price_after_tax)
		assert_equal(0, Good.new("1 chocolate bar at 0.85").tax)

		assert_equal(10.5, Good.new("1 imported box of chocolates at 10.00").price_after_tax)
		assert_equal(0.5, Good.new("1 imported box of chocolates at 10.00").tax)
		assert_equal(54.65, Good.new("1 imported bottle of perfume at 47.50").price_after_tax)
		assert_equal(7.15, Good.new("1 imported bottle of perfume at 47.50").tax)

		assert_equal(32.19, Good.new("1 imported bottle of perfume at 27.99").price_after_tax)
		assert_equal(4.2, Good.new("1 imported bottle of perfume at 27.99").tax)
		assert_equal(20.89, Good.new("1 bottle of perfume at 18.99").price_after_tax)
		assert_equal(1.9, Good.new("1 bottle of perfume at 18.99").tax)
		assert_equal(9.75, Good.new("1 packet of headache pills at 9.75").price_after_tax)
		assert_equal(0, Good.new("1 packet of headache pills at 9.75").tax)
		assert_equal(11.85, Good.new("1 box of imported chocolates at 11.25").price_after_tax)
		assert_equal(0.6, Good.new("1 box of imported chocolates at 11.25").tax)
	end

end