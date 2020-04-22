# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# ここでは引数を正しい順番で渡さないといけない
Gear.new(
  52,
  11,
  Wheel.new(26, 1.5)
).gear_inches

# ------------------固定されたパラメーターの代わりに、ハッシュを受け取るようにする-----------------------

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

Gear.new(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)
).gear_inches

# テクニックとして、安定性の高い引数は固定順で受け入れ、安定性の低い引数は、オプションハッシュで受け取るようにする

# ------------------明示的にデフォルト値を設定する-------------------

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog = args[:cog] || 18
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# ------------------------------fetchメソッドでデフォルト値を設定する--------------------------------

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    # fetchメソッドのほうが、キーがハッシュに無いときのみ第２引数を利用するように機能させることができる
    @chainring = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * wheel.diameter
  end
end


# ------------------------------独立したラッパーメソッドにデフォルト値を代入する--------------------------------

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    # デフォルト値が単純な数字や文字列以上のものであるときは、defaultsメソッドを実装しましょう
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def defaults
    { chainring: 40, cog: 18 }
  end
end
