# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  # このメソッドは、２つ以上の責任を持っている
  # def gear_inches
  #   ratio * (rim + (tire * 2))
  # end

  # 以下のように責任を分離する
  # これらのリファクタリングは、たとえ最終的な設計がわかっていない段階でも施すべき
  def gear_inches
    ratio * diameter
  end

  def diameter
    rim + (tire * 2)
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(53, 11, 24, 1.25).gear_inches
