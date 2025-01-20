

class PasswordManager
  attr_reader

  def initialize()
    @passwords = {}
  end

  def prompt_screen
    loop do
      puts "what would you like to do?"
      puts "look at passwords (P)"
      puts "create new password (N)"
      puts "Decrupt (D)"
      puts "Exit (q)"
      prompt = gets.chomp.downcase
      case prompt
        when "p"
          password_lookup
        when "n"
          create_password
        when "d"
          decryption
        when "q"
          break
        else
          puts "Invalid response. Please try again."
      end
    end
  end
  
  def password_lookup
    @passwords.each{|hash| puts "#{hash}\n"}
  end

  def create_password
    puts "What is this password for?"
    use = gets.chomp
    puts "what woudld you like your passwaord to be?"
    password = gets.chomp
    puts "what would key?(6-digit)"
    key = gets.chomp
    puts "what date?(mmddyy)"
    date = gets.chomp
    message = Enigma.new(password, key, date)
    encryption = message.encrypt
    @passwords[use] = {password: password, encrypted: encryption, key: key, date: date}
    puts "Your password is #{encryption}"
  end
  
  def decryption
    puts "What would you like to decrypt?" 
    code = gets.chomp
    puts "What's the key?"
    key = gets.chomp
    puts "What's the date?"
    date = gets.chomp

    message = Enigma.new(code, key, date)
    decryption = message.decrypt
    puts "the decrypted password is: #{decryption}"
  end
end
