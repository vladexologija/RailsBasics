module CustomMatcher
  class SameTime
    def initialize(expected)
      @expected = expected
    end

    def matches?(actual)
      @actual = actual
      actual == @expected
    end

    def failure_message_for_should
      "expected #{@actual.inspect} to be same as #{@expected.inspect}"
    end

    def failure_message_for_should_not
      "expected #{@actual.inspect} should not be same as #{@expected.inspect}"
    end
  end

  def be_same_time(expected)
    SameTime.new(expected)
  end
end
