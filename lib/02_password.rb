def signup
    puts "Create a password"
    print "> "
    pwd = gets.chomp
    return pwd
end

def signin(pwd)
    input = nil
    while input != pwd
        puts "Enter your password :"
        input = gets.chomp
    end
end

def welcome_screen
    puts "You are logged in!"
end

def play
    pwd=signup
    signin(pwd)
    welcome_screen
end

play