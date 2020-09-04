require 'rails_helper'

RSpec.describe Rental, type: :model do
  it 'should generate a code on create' do
    rental = create(:rental)
    rental.save

    expect(rental.code).to_not be_blank
  end

  it 'not found code' do
    result = Rental.find_by(code: 'AAAAAA')

    expect(result).to be_blank
  end
end
