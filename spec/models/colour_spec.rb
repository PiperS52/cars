require 'rails_helper'

describe 'Colour', type: :model do
  it 'has a name' do 
    colour = Colour.new(
      name: ""
    )

    expect(colour).to_not be_valid

    colour.name = "red"
    expect(colour).to be_valid
  end 

end