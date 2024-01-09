require 'spec_helper'
require './lib/visitor'

RSpec.describe Visitor do
    it 'initializes visitors with attributes' do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        expect(visitor1.name).to eq("Bruce")
        expect(visitor1.height).to eq(54)
        expect(visitor1.spending_money).to eq('$10')
    end

    it 'can show visitor preferences and add preferences' do
        visitor1 = Visitor.new('Bruce', 54, '$10')
        visitor2 = Visitor.new('Tucker', 36, '$5')
        visitor3 = Visitor.new('Penny', 64, '$15')

        expect(visitor1.preferences).to eq([])
        visitor1.add_preference(:gentle)
        visitor1.add_preference(:thrilling)
        expect(visitor1.preferences).to eq([:gentle, :thrilling])
    end

    
end


