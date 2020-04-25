# frozen_string_literal: true

class RecumbentBike < Bicycle
  attr_reader :flag

  # initialize時にsuperを送っていないことにより、弊害が生じる
  def initialize(args)
    @flag = args[:flag]
  end

  def spares
    super.merge({ flag: flag })
  end

  def default_chain
    '9-speed'
  end

  def default_tire_size
    '28'
  end
end

bent = RecumbentBike.new(
  flag: 'tall and orange'
)

bent.spares
# -> {
# tire_size: nil, <- 初期化されていない
# chain: nil,
# flag: 'tall and orange'
# }
