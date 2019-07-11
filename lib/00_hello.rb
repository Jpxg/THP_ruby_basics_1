#Methode pour obtenir l'input utilisateur
def say_hello(first_name)
    puts "Hello, #{first_name} !"
end
#Recuperer l'input et en faire une methode
def ask_first_name
    puts "what's your first name ?"
    first_name = gets.chomp
    return first_name
end
#Call
first_name = ask_first_name
say_hello(first_name)