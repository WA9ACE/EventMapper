require 'eventmapper/version'

module EventMapper
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
    if args.empty?
      @events[event].each do |proc|
        Thread.new { proc.call }
      end
    else
      @events[event].each do |proc|
        Thread.new { proc.call *args }
      end
    end
  end
end
