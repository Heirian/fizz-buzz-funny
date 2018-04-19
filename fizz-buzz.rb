# frozen_string_literal: true
class Object
  def presence
    self if !empty?
  end
end

class Funny
  def to_s
    self.class.to_s
  end

  alias_method :to_str, :to_s

  def +(other)
    self.to_s + other.to_s
  end
end

class Fizz < Funny; end
class Buzz < Funny; end

class FizzBuzz
  DEFAULT_COMING = 1
  MAX_COMING = 100

  def self.run(log = '', oncoming = DEFAULT_COMING, max_oncoming = MAX_COMING)
    new(log, oncoming, max_oncoming).run
  end

  def run
    interval = fizzer
    interval += buzzer
    @log += interval.presence || @oncoming.to_s
    continue_flow? ? continue_flow : @log
  end

  private

  def buzzable?
    @oncoming % 5 == 0
  end

  def buzzer
    buzzable? ? Buzz.new : ''
  end

  def continue_flow
    FizzBuzz.run(@log + ', ', @oncoming.next, @maximum_oncoming)
  end

  def continue_flow?
    @oncoming < @maximum_oncoming
  end

  def fizzable?
    @oncoming % 3 == 0
  end

  def fizzer
    fizzable? ? Fizz.new : ''
  end

  def initialize(log, oncoming, maximum_oncoming)
    @log = log
    @oncoming = oncoming
    @maximum_oncoming = maximum_oncoming
  end
end

p FizzBuzz.run
