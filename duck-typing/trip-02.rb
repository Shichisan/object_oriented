# frozen_string_literal: true

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare preparers
    preparers.each { |preparer|
      case preparer
      when Mechanic
        preparers.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    }
  end
end

# このクラスのインスタンスを渡すことになったとしても動作する

class Mechanic
  def prepare_bicycles bicycles
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle bicycle
    # ...
  end
end

class TripCoordinator
  def buy_food customers
    # ...
  end
end

class Driver
  def gas_up vehicle
    # ...
  end

  def fill_water_tank vehicle
    # ...
  end
end
