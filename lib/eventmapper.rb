require 'eventmapper/version'
require 'pry'

module EventMapper
  attr_accessor :event_blocks

  def events
    @events ||= Hash.new { |h, k| h[k] = [] }
  end

  def events_sync?
    @events_sync ||= true
  end

  def events_sync=(bool)
    @events_sync = bool
  end
  
  def on(event, &block)
    events[event] << block
  end

  def fire(event, *args)
    if args.empty?
      events[event].each do |proc|
        if events_sync?
          proc.call
        else
          Thread.new { proc.call }
        end
      end
    else
      events[event].each do |proc|
        if events_sync?
          proc.call *args
        else
          Thread.new { proc.call *args }
        end
      end
    end
  end
end
