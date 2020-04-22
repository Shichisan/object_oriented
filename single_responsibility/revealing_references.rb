# frozen_string_literal: true

class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  # このめそっどは、繰り返しと直径計算の２つ責任を持っている
  # def diameters
  #   wheels.collect { |wheel|
  #     wheel.rim + (wheel.tire * 2)
  #   }
  # end

  # 以下のように分割する
  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell|
      Wheel.new(cell[0], cell[1])
    }
  end
end
