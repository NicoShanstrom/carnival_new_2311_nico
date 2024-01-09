class Ride
    attr_reader :name,
                :min_height,
                :admission_fee,
                :excitement,
                :rider_log,
                

    def initialize(attributes)
        @name = attributes[:name]
        @min_height = attributes[:min_height]
        @admission_fee = attributes[:admission_fee]
        @excitement = attributes[:excitement]
        @total_revenue = 0
        @rider_log = {}
       
        
    end

    def total_revenue
        @total_revenue += admission_fee
    end

    def board_rider(visitor)
        if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
        @rider_log[visitor] ||= 0
        @rider_log[visitor] += 1
        visitor.deduct_money(admission_fee)
        else
            puts "Visitor preferences or height do not match ride requirements"
        end
    end

    private 

    def deduct_money(admission_fee)
        visitor.deduct_money(admission_fee)
    end

end