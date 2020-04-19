# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    # 依存関係その１
    # GearはWheelという名前のクラスが存在することを予想している
    # 依存関係その２
    # GearはWheelのインスタンスがdiameterに応答すること予想している
    # 依存関係その３
    # Gearは、Wheel.newにrimとtireが必要なことを知っている
    # 依存関係その４
    # GearはWheel.newの最初の引数がrimで、２番目の引数がtireである必要があることを知っている
    # 明示的なクラスをメソッドの深いところでハードコーディングしていると、このメソッドは、Wheelのインスタンスの直径しか測らないという意図に見える
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
