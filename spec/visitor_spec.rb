require 'spec_helper'
require './lib/visitor'

RSpec.describe Visitor do
    it 'initializes with attributes' do
        visitor = Visitor.new('Bruce', 54, '$10')
        expect(visitor.name).to eq("Bruce")
        expect(visitor.height).to eq(54))
        expect(visitor.spending_money).to eq(10)
    end
        


