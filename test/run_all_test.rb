require 'test/unit/testsuite'
require 'test/unit/ui/console/testrunner'

require "./goods_test"
require "./good_test"

class RunAllTest
	def self.suite
		suite = Test::Unit::TestSuite.new
		suite << GoodsTest.suite
		suite << GoodTest.suite
		return suite		
	end	
end
Test::Unit::UI::Console::TestRunner.run(RunAllTest)
