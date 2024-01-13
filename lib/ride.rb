class Ride
    attr_reader :name,
                :min_height,
                :admission_fee,
                :excitement,
                :rider_log
                

    def initialize(info)
        
        @name = info[:name]
        @min_height = info[:min_height]
        @admission_fee = info[:admission_fee]
        @excitement = info[:excitement]
        @rider_log = {}
    end

    def total_revenue
        @rider_log.values.sum * @admission_fee
    end
    
    # def board_rider(visitor)
        
    #     if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
    #         if @rider_log[visitor].nil?
    #             @rider_log[visitor] = 0
    #             @rider_log[visitor] += 1
    #         else
    #             @rider_log[visitor] += 1
               
    #         end
    #         visitor.spending_money -= admission_fee
    #     else
    #         puts "Visitor preferences or height do not match ride requirements"
    #     end
    # end

    def board_rider(visitor)
        if visitor.preferences.include?(@excitement) && visitor.tall_enough?(@min_height)
            @rider_log[visitor] ||= 0  # Set default value if the key doesn't exist
            @rider_log[visitor] += 1
            visitor.spending_money -= admission_fee
        else
        puts "Visitor preferences or height do not match ride requirements"
        end
    end


end