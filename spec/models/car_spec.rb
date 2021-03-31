require 'rails_helper'

describe 'Car', type: :model do
  let(:colour) { Colour.create(id: 1, name: "red")}

  it 'has a make' do
    car = Car.new(
      make: "",
      model: "Civic", 
      build_date: DateTime.new(2020, 11, 12), 
      colour_id: colour.id 
    ) 

    expect(car).to_not be_valid

    car.make = "New make"
    expect(car).to be_valid 
  end 

  it 'has a model' do 
    car = Car.new(
      make: "Honda",
      model: "", 
      build_date: DateTime.new(2020, 11, 12), 
      colour_id: colour.id 
    ) 

    expect(car).to_not be_valid

    car.model = "Civic"
    expect(car).to be_valid
  end 

  it 'has a build_date' do 
    car = Car.new(
      make: "Honda",
      model: "Civic", 
      build_date: "", 
      colour_id: colour.id 
    ) 

    expect(car).to_not be_valid

    car.build_date = DateTime.new(2020, 11, 12)
    expect(car).to be_valid
  end 

end 