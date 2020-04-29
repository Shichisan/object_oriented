# frozen_string_literal: true

class Gear
  attr_reader :chainring, :cog, :wheel, :observer
  def initialize(args)
    @observer = args[:observer]
  end

  def set_cog(new_cog)
    @cog = new_cog
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed

    def changed
      observer.changed(chainring, cog)
    end
  end
end

# モックを使って送信メッセージを証明する

class GearTest < Minitest::Unit::TestCase
  def setup
    @observer = MiniTest::Mock.new
    @gear = Gear.new(
      chainring: 52,
      cog: 11,
      observer: @observer
    )
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27])
    @gear.set_cog(27)
    @observer.verify
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11])
    @gear.set_chainring(42)
    @observer.verify
  end

end
