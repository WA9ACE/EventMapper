require 'spec_helper'

class Thing
  include EventMapper
end

describe EventMapper do
  before :all do
    @thing = Thing.new
  end

  it 'should register an event' do
    @thing.on :something do
      2 + 2
    end
  end

  it 'should register an event with params' do
    @thing.on :with_params do |first, second|
      puts "#{first} #{second}"
    end
  end

  it 'should fire an event' do
    @thing.fire :something
  end

  it 'should fire an event with params' do
    @thing.fire :with_params, 'hallo', 'hooman'
  end
end