# frozen_string_literal: true

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

# Partクラスのオブジェクトをラップする簡潔なクラスになった
class Parts < Array
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    select { |part| part.needs_spare }
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

chain = Part.new(name: 'chain', description: '10-speed')

road_tire = Part.new(name: 'tire_size', description: '23')

tape = Part.new(name: 'tape_color', description: 'red')

mountain_tire = Part.new(name: 'tire_size', description: '2.1')

rear_shock = Part.new(name: 'rear_shock', description: 'Fox')

front_shock = Part.new(
  name: 'front_shock',
  description: 'Manitou',
  needs_spare: false
)

road_bike_parts = Parts.new([chain, road_bike, tape])

road_bike = Bicycle.new(
  size: 'L',
  parts: road_bike_parts
)

# PartsにArrayを継承すると、以下のような弊害が発生する

# Partsは + をArrayから継承するため、
# 2つのPartsは加え合わせられる

combo_parts = (mountain_bike.parts + road_bike.parts)

# + は間違いなくPartsを組み合わせる
combo_parts.size

# しかし + が返すオブジェクトは
# spares を理解しない

combo_parts.spares

mountain_bike.parts.class
road_bike.parts.class
combo_parts.class
