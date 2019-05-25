class Perro
    #contructor
    def initialize(raza,nombre)
        @raza=raza
        @nombre=nombre
    end
    
    #metodos
    def ladrar
        puts 'Guaguau guaguau!'
    end
    def saludar
        puts "Soy un perro de #{@raza} y mi nombre es #{@nombre}"
    end
end

#Se crea objeto
d=Perro.new('Labrador','Benzy')

d.ladrar
d.saludar
d1=d
d1.saludar

d=nil
d1.saludar

d.saludar