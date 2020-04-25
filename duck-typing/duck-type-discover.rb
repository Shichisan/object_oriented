# frozen_string_literal: true

# クラスで分岐するcase文は、未発見のダックタイプである可能性が高い
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare preparers
    preparers.each { |preparer|
      case preparer
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# kind_of? と is_a? は未発見のダックタイプの可能性がある
if preparer.kind_of?(Mechanic)
  preparer.prepare_bicycles(bicycles)
elsif preparer.kind_of?(TripCoordinator)
  preparer.buy_food(customers)
elsif preparer.kind_of?(Driver)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end

# respond_to? は未発見のダックタイプの可能性がある
if preparer.respond_to?(:prepare_bicycles)
  preparer.prepare_bicycles(bicycles)
elsif preparer.respond_to?((:buy_food)
  preparer.buy_food(customers)
elsif preparer.kind_of?(Driver)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end

