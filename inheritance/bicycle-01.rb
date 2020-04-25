# frozen_string_literal: true

class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args.fetch(:size)
    @tape_color = args.fetch(:tape_color)
  end

  # すべての自転車はデフォ値として、同じタイヤサイズとチェーンサイズを持つ
  def spares
    {
      chain: '10-speed',
      tire_size: '23',
      tape_color: 'tape_color'
    }
  end

  # 他にもメソッドたくさん
end

bike = Bicycle.new(
  size: 'M',
  tape_color: 'red'
)

bike.size
bike.spares
