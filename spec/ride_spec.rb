require 'spec_helper'

RSpec.describe Ride do
    it 'Can have rides with attributes' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1.name).to eq("Carousel")
        expect(ride1.min_height).to eq(24)
        expect(ride1.admission_fee).to eq(1)
        expect(ride1.excitement).to eq(:gentle)
    end

    xit 'can collect revenue from rides' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1.total_revenue).to eq(0)
    end

end