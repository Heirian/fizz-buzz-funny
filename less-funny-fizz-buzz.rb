class Object
  def presence
    self if !empty?
  end
end

class FizzBuzz
  class << self
    def buzzable?(num)
      num % 5 == 0
    end

    def buzzer(num)
      buzzable?(num) ? 'Buzz' : ''
    end

    def fizzable?(num)
      num % 3 == 0
    end

    def fizzer(num)
      fizzable?(num) ? 'Fizz' : ''
    end

    def run(log, oncoming)
      interval = fizzer(oncoming)
      interval += buzzer(oncoming)
      log += interval.presence || oncoming.to_s
      oncoming > 99 ? log : run(log + ', ', oncoming + 1)
    end
  end

  private_class_method :fizzable?
  private_class_method :buzzable?
  private_class_method :fizzer
  private_class_method :buzzer
end

p FizzBuzz.run('', 1)
