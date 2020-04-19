# frozen_string_literal: true

# Gearが外部インターフェースの一部の場合
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog = cog
      @wheel = wheel
    end
  end
end

# 外部のインターフェースをラップし、自身を変更から守る
# このクラスの唯一の目的が、ほかのクラスのインスタンスの作成であること
# このようなオブジェクトに「ファクトリー」という名前を付けている
module GearWrapper
  class Gear
    def self.gear(args)
      SomeFramework::Gear.new(
        args[:chainring],
        args[:cog],
        args[:wheel]
      )
    end
  end
end

# 引数を持つハッシュを渡すことでGearのインスタンスを作成できるようになった
GearWrapper.gear(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)
).gear_inches
