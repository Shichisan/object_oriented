# frozen_string_literal: true

class Bicycle
  attr_reader :size

  def initialize(args={})
    @size = args[:size]
  end
end

class RoadBike < Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(args)
    @tape_color = args[:tape_color]
    super(args)
  end

  def spares
      {
        chain: '10-speed',
        tire_size: '23',
        tape_color: 'tape_color'
      }
    end
  end
end


class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox'
)

puts mountain_bike.size

puts mountain_bike.spares

