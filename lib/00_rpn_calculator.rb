class RPNCalculator < Array
  def value
    self.last
  end

  def plus
    error_check
    self << self.pop + self.pop
  end

  def minus
    error_check
    a = self.pop
    b = self.pop
    self << b - a
  end

  def times
    error_check
    self << self.pop * self.pop
  end

  def divide
    error_check
    a = self.pop
    b = self.pop
    self << b.to_f / a.to_f
  end

  def error_check
    raise "calculator is empty" if self.length < 2
  end

  OPERATORS = %w[+ - * /]
  def tokens(string)
    string.split(" ").map {
      |el| OPERATORS.include?(el) ? el.to_sym : el.to_i }
  end

  def evaluate(string)
    commands = tokens(string)
    commands.each do |command|
      case command
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        push(command)
      end
    end
    self.value
  end

end

if __FILE__ == $PROGRAM_NAME
  instruction_file = ARGV[0]
  calculator = RPNCalculator.new
  if instruction_file
    instructions = File.readlines(instruction_file)
    instructions.each do |instruction|
      puts calculator.evaluate(instruction.chomp)
    end

  else
    while true
      instructions ||= ""
      next_instruction = $stdin.gets
      instructions << "#{next_instruction.chomp} "
      if next_instruction == "\n"
        puts calculator.evaluate(instructions.strip)
        exit
      end
    end
  end


end
