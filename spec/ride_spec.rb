require 'spec_helper'
require './lib/ride'
require './lib/visitor'

RSpec.describe Ride do
    it 'Can have rides with attributes' do
       
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })

        expect(ride1.name).to eq('Carousel')
        expect(ride1.min_height).to eq(24)
        expect(ride1.admission_fee).to eq(1)
        expect(ride1.excitement).to eq(:gentle)
    end

    it 'can collect revenue from rides' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)
        expect(ride1.total_revenue).to eq(0)
        
        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)

        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(4)

        expect(ride1.total_revenue).to eq(3)

    end

    it 'allows visitors to board ride if their preferences match ride excitement level and keep a log' do
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        visitor1.add_preference(:gentle)
        visitor2.add_preference(:gentle)

        ride1.board_rider(visitor1)
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)

        expect(ride1.rider_log).to include({ visitor1 => 2, visitor2 => 1 })

        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })

        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)

        expect(visitor2.preferences).to eq([:gentle, :thrilling])

        ride3.board_rider(visitor1)
        ride3.board_rider(visitor2)
        ride3.board_rider(visitor3)

        expect(visitor1.spending_money).to eq(8)
        expect(visitor2.spending_money).to eq(4)
        expect(visitor3.spending_money).to eq(13)

        expect(ride3.rider_log).to include( {visitor3 => 1})

        expect(ride3.total_revenue).to eq(2)
    end
end