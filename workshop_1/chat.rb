class Chat
  # Initialize the class
  #
  # Parameters
  #   name: a User name
  #   log_file: The path to the file that will hold the chat log (default: chat.dat)
  def initialize(name, log_file = 'chat.dat')
    @name = name
    @line = 0
    @log_file = log_file
  end

  # Prints a command prompt and waits for an input from the user. Returns the input, without the trailing new line.
  def prompt
    print build_prompt_for_display(@name, @line)
    input = gets.strip
    input
  end

  # Displays the command prompt and saves everything to the chat file.
  # the method will yield the input to the supplied block
  def log
    File.open(@log_file, 'a+') do |fh|
      while input = self.prompt
        unless (input.empty? || input == 'q')
          fh.puts build_prompt_for_log(@name, Time.now, input.gsub(':', '%3A')) 
          @line += 1
          fh.flush
        end

        yield input
      end
    end
  end

  # serialise the message ready for saving
  def build_prompt_for_log(name, time, message)
    "#{name}:#{time.to_i}:#{message}"
  end

  # Returns a nicer string version of the message
  def build_prompt_for_display(name, line, message = nil)
    "#{name.downcase}:#{line}>" + (message ? " #{message}" : '')
  end

  # Yields each line of the current chat log
  # The block must take three arguments: name, time and message
  def get_log
    File.open(@log_file, 'r') do |fh|
      fh.read.split("\n").each do |line|
        name, time, message = line.split(':')
        yield(name, time, message)
      end
    end
  end
end

print "Please enter your name: "
name = gets.strip
puts "Hello #{@name}, welcome to RubyChat"
puts "It's #{Time.now.to_s}\n"
puts "Please chat away; hit 'q' to quit"

chat = Chat.new(name)
chat.log do |input|
  case(input)
  when 'q'
    exit(0)
  when ''
    chat.get_log do |user, time, message|
      puts chat.build_prompt_for_display(user, time, message.gsub('%3A', ':'))
    end
  end
end
