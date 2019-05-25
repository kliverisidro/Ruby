lenguajes=%w{Ruby Pyton Java}
lenguajes.each do |lenguaje|
    puts "¡Me gusta "+lenguaje+"!"
    puts "¿A ti no?"
end
puts "-------------"

lenguajes.delete('Pyton')
lenguajes.each do |lenguaje|
    puts "¡Me gusta "+lenguaje+"!"
    puts "¿A ti no?"
end
puts "-------------"
lenguajes=[["java","pyton"],[1,2,3],[123,222,222,2,222,2222]]
lenguajes.each do |lenguaje|
    puts lenguaje
    puts "lista de listas"
    lenguaje.each do |l|
        puts l
    end
end

puts "-------------"

vec=[34,12,1,38]
puts vec.sort
puts vec

puts vec.length
puts vec.first
puts vec.last
