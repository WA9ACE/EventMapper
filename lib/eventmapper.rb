require 'eventmapper/version'

module EventMapper

  def set_event_blocking(bool)
    @event_blocks = bool
  end

  def event_blocks?
    if @event_blocks.nil?
      @event_blocks = true
    else
      @event_blocks
    end
  end

  def on(event, &block)
    if @events.nil?
      @events = { event => [block] }
    elsif @events[event].nil?
      @events[event] = [block]
    else
      @events[event] << block
    end
  end

  def fire(event, *args)
    if @event_blocks.nil?
      @event_blocks = true
    end

    if args.empty?
      @events[event].each do |proc|
        if @event_blocks
          proc.call
        else
          Thread.new { proc.call }
        end
      end
    else
      @events[event].each do |proc|
        if @event_blocks
          proc.call *args
        else
          Thread.new { proc.call *args }
        end
      end
    end
  end
end
