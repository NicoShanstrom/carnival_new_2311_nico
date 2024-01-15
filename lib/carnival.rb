class Carnival
    attr_reader :duration, :rides
    
    def initialize(duration)
        @duration = duration
        @rides = []
    end

    def add_ride(ride)
        @rides << ride
    end

    def most_popular_ride
        @rides.max_by do |ride|
            ride.rider_log.values.sum
        end
    end

    def most_profitable_ride
        @rides.max_by do |ride|
         ride.total_revenue
        end
    end

    def all_rides_total_revenue
        all_rides_total_revenue = 0
        @rides.each do |ride|
        all_rides_total_revenue += ride.total_revenue
    end
        all_rides_total_revenue
    end
end