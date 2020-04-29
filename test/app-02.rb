# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    # wheel 変数内のオブジェクトが
    # Diameterizable ロールを担う
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class GearTest < Minitest::Unit::TestCase
  def test_calculates_gear_inches
    gear = Gear.new(
      chainring: 52,
      cog: 11,
      wheel: Wheel.new(26, 1.5)
    )

    assert_in_delta(137.1,
                    gear.gear_inches,
                    0.01
                   )
  end
end
