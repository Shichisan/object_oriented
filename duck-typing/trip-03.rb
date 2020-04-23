# frozen_string_literal: true

class Trip
  attr_reader :bicycles, :customers, :vehicle
  def prepare preparers
    preparers.each { |preparer|
      preparer.prepare_trip(self)}
  end
end

# すべてのpreparerは、'prepare_trip' に応答するダック

class Mechanic
  def prepare_trip trip
    trip.bicycles.each { |bicycle|
    prepare_bicycle(bicycle) }
  end
end

class TripCoordinator
  def prepare_trip trip
    trip.customers.each { |customer|
    buy_food(customer) }
  end
end

class Driver
  def prepare_trip trip
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end

