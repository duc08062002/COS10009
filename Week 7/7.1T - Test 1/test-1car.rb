require './input_functions'

# Complete the code below
# Use input_functions to read the data from the user
class Car 
    attr_accessor :id, :manufacturer, :model, :kilometres
    def initialize (id, manufacturer, model, kilometres)
        @id = id
        @manufacturer = manufacturer
        @model = model
        @kilometres = kilometres
    end
end

def read_car()
	car_id = read_integer("Enter car id:")
    car_manufacturer = read_string("Enter manufacturer:")
    car_model = read_string("Enter model:")
    car_kilometres = read_string("Enter kilometres:")
    car = Car.new(car_id, car_manufacturer, car_model, car_kilometres)
    return car
end


def read_cars()
	count = read_integer("How many cars are you entering:")
    cars = Array.new
    index =0
    while index<count
     car = read_car()
     cars << car
     index+=1
    end
    return cars
end

def print_car(car)
	puts ('Id: ' + car.id.to_s)
    puts ('Manufacturer: '+ car.manufacturer.to_s)
    puts('Model: ' + car.model.to_s)
    puts('Kilometres: ' + car.kilometres.to_s)
end

def print_cars(cars)
	count = cars.length
    index = 0
    while index < count do
        print_car(cars[index])
        index +=1
    end   
end

def main()
	cars = read_cars()
	print_cars(cars)
end

main()