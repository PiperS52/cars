require 'rails_helper'

describe 'Cars API', type: :request do 
  before do 
    FactoryBot.create(:colour, id: 1, name: "red")
    FactoryBot.create(:colour, id: 2, name: "blue")
  end 

  describe 'GET /cars' do 
    it 'returns all cars' do 
      FactoryBot.create(:car, make: "Honda", model: "Civic", build_date: DateTime.new(2020, 11, 12), colour_id: 1)
      FactoryBot.create(:car, make: "Toyota", model: "Prius", build_date: DateTime.new(2019, 2, 9), colour_id: 2)
  
      get '/cars'
  
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end 
  end 

  describe 'GET /cars/:id' do 
    it 'returns a specific car' do 
      car_one = FactoryBot.create(:car, make: "Honda", model: "Civic", build_date: DateTime.new(2020, 11, 12), colour_id: 1)
      car_two = FactoryBot.create(:car, make: "Toyota", model: "Prius", build_date: DateTime.new(2019, 2, 9), colour_id: 2)

      get "/cars/#{car_one.id}"

      expect(response).to have_http_status(:success)
      expect((JSON.parse(response.body))['make']).to eq("Honda")
      expect((JSON.parse(response.body))['model']).to eq("Civic")
    end 
  end

  describe 'POST /cars' do
    it 'creates a car' do 
      expect {
        post '/cars', params: { car: { make: "Seat", model: "Ibiza", build_date: DateTime.new(2019, 9, 12), colour_id: 1} }
      }.to change { Car.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end 

    it 'sends an error response if car too old' do
      
      post '/cars', params: { car: { make: "Volkswagen", model: "Polo", build_date: DateTime.new(2004, 9, 12), colour_id: 1} }
     
      expect(response).to have_http_status(:unprocessable_entity)
    end 

    it 'sends an error response if fields missing' do
      
      post '/cars', params: { car: { make: "", model: "Polo", build_date: DateTime.new(2004, 9, 12), colour_id: 1} }
     
      expect(response).to have_http_status(:unprocessable_entity)
    end 
  end
  
  describe 'DELETE /cars/:id' do 
    it 'deletes a car' do 
      car = FactoryBot.create(:car, make: "Honda", model: "Civic", build_date: DateTime.new(2020, 11, 12), colour_id: 1)

      expect {
        delete "/cars/#{car.id}"
      }.to change { Car.count }.from(1).to(0)
  
      expect(response).to have_http_status(:no_content)
    end 
  end 

end 