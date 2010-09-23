class Chat
  def initialize(name, log_file = 'chat.dat')
    @name = name
    @line = 0
    @log_file = log_file
  end

  def prompt
    print build_prompt_for_display(@name, @line)
    input = gets.strip
    input
  end

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

  def build_prompt_for_log(name, time, message)
    "#{name}:#{time.to_i}:#{message}"
  end

  def build_prompt_for_display(name, line, message = nil)
    "#{name.downcase}:#{line}>" + (message ? " #{message}" : '')
  end

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
