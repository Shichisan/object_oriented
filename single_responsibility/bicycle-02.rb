# frozen_string_literal: true

class Gear
  # メソッドに必要な引数の数の変更は、そのメソッドを呼び出している箇所をすべて壊します
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

  def gear_inches
    ratio * (rim + (tire * 2))
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches

# 上記は問題なく稼働するが、以下のバグが生まれる
# puts Gear.new(52, 11).ratio