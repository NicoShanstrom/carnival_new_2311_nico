require 'spec_helper'
require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do
    it 'can be a carnival with a duration of 14 days' do
        carnival = Carnival.new(14)
        
        expect(carnival.duration).to be_a(Integer)
        expect(carnival.duration).to eq(14)
    end

    it 'can add rides and list those rides' do
        carnival = Carnival.new(14)
        ride4 = Ride.new({ name:'Gravitron', min_height: 24, admission_fee: 1, excitement: :thrilling })

        carnival.add_ride(ride4)
        
        expect(carnival.rides).to eq([ride4])
        # require 'pry'; binding.pry
    end

    it 'can return its most popular ride' do
        carnival = Carnival.new(14)
        visitor1 = Visitor.new('Bruce', 54, '$100')
        visitor2 = Visitor.new('Tucker', 54, '$100')
        visitor3 = Visitor.new('Penny', 54, '$100')
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        ride4 = Ride.new({ name:'Gravitron', min_height: 24, admission_fee: 1, excitement: :thrilling })

        carnival.add_ride(ride1)
        carnival.add_ride(ride2)
        carnival.add_ride(ride3)
        carnival.add_ride(ride4)

        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)
        visitor3.add_preference(:gentle)
        

        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride2.board_rider(visitor2)
        ride2.board_rider(visitor2)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)

        expect(carnival.most_popular_ride).to eq(ride3)
    end

    it 'can return its most profitable ride' do
        carnival = Carnival.new(14)
        visitor1 = Visitor.new('Bruce', 54, '$100')
        visitor2 = Visitor.new('Tucker', 54, '$100')
        visitor3 = Visitor.new('Penny', 54, '$100')
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        ride4 = Ride.new({ name:'Gravitron', min_height: 24, admission_fee: 1, excitement: :thrilling })

        carnival.add_ride(ride1)
        carnival.add_ride(ride2)
        carnival.add_ride(ride3)
        carnival.add_ride(ride4)

        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)
        visitor3.add_preference(:gentle)
        

        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride2.board_rider(visitor2)
        ride2.board_rider(visitor2)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        
        expect(carnival.most_profitable_ride).to eq(ride2)
    end
    
    it 'can calculate the total revenue earned from all its rides' do
        carnival = Carnival.new(14)
        visitor1 = Visitor.new('Bruce', 54, '$100')
        visitor2 = Visitor.new('Tucker', 54, '$100')
        visitor3 = Visitor.new('Penny', 54, '$100')
        ride1 = Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })
        ride2 = Ride.new({ name: 'Ferris Wheel', min_height: 36, admission_fee: 5, excitement: :gentle })
        ride3 = Ride.new({ name: 'Roller Coaster', min_height: 54, admission_fee: 2, excitement: :thrilling })
        ride4 = Ride.new({ name:'Gravitron', min_height: 24, admission_fee: 1, excitement: :thrilling })
        
        carnival.add_ride(ride1)
        carnival.add_ride(ride2)
        carnival.add_ride(ride3)
        carnival.add_ride(ride4)
        
        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)
        visitor2.add_preference(:gentle)
        visitor2.add_preference(:thrilling)
        visitor3.add_preference(:thrilling)
        visitor3.add_preference(:gentle)
        
        
        ride1.board_rider(visitor2)
        ride1.board_rider(visitor1)
        ride2.board_rider(visitor2)
        ride2.board_rider(visitor2)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        ride3.board_rider(visitor3)
        
        expect(carnival.all_rides_total_revenue).to eq(18)
        
    end
end