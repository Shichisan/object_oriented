# frozen_string_literal: true

class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end
end

# リムとタイヤのサイズ（ここではミリメートル!）の2次元配列
@data = [[622, 20], [622, 23], [559, 30], [559, 40]]

# この状態だと、diametersメソッドは、直径を計算する方法だけ知っているわけではない
# 配列のどこを見ればリムとタイヤがあるかまで知っている
# また配列の構造に依存している
# リムが[0]にあるという知識は複製されるものではなく、ただ一箇所に把握されるべき
