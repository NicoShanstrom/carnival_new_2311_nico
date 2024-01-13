require 'spec_helper'
require './lib/ride'
require './lib/visitor'
require './lib/carnival'

RSpec.describe Carnival do
    it 'can be a carnival with an atrribute of duration' do
        
        carnival = Carnival.new('14 days')

        expect(carnival.duration).to eq('14 days')
    end
end