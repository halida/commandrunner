$stdout.sync = true

def check
  while s = gets
    begin
      puts "=> #{eval(s)}"
    rescue Exception => e
      puts "error: #{e}"
    end
    # $stdout.write "on input: #{s}"
    # puts "on input: #{s}"
  end
end

check
