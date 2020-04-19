# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    # 外部から依存オブジェクトを注入できないくらい制約が強い場合、Wheelのインスタンス作成をせめてGearクラス内で隔離する
    # ただしGearが作られるとき、Wheelの無条件で作られることに注意が必要
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# -------------------------------------------------

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  # 依然として、rimとtireを初期化時の引数として使うことに変わりはないし、
  # Wheelインスタンスも、独自に内部で作成している
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end

# ---------------------------------

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  # 外部的な依存を取り除き、専用のメソッド内にカプセル化すること
  def gear_inches
    # 何行か恐ろしい計算がある
    # wheel.diameterからdiameterに変更することにより、メッセージはselfに送るものだけになった
    foo = some_intermediate_result * diameter
    # 何行か恐ろしい計算がある
  end

  def diameter
    wheel.diameter
  end

  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end

end
