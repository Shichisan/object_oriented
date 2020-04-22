# frozen_string_literal: true

class Gear
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    # 破滅への道
    @chainring / @cog.to_f
  end
end

# インスタンス変数は、常にアクセサメソッドで包み、直接参照しないようにしましょう
# 単一責任のクラスを作るためには、オブジェクトの持つデータではなく、振る舞いに依存させるべき

class Gear
  ## ここでアクセサメソッドを利用して、変数を隠蔽します
  attr_reader :chainring, :cog
  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end
