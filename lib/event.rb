class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name        = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.select do |food_truck|
      food_truck.check_stock(item) > 0
    end
  end

  def sorted_item_list
    @food_trucks.flat_map do |food_truck|
      food_truck.all_items_in_stock.map do |item|
        item.name
      end
    end.sort.uniq
  end

  def total_inventory
    result = Hash.new
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, quantity|
        result[item] = {quantity: 0, food_trucks: []} if result[item].nil?
        result[item] [:quantity] += quantity
        result[item][:food_trucks] << food_truck
      end
    end
    result
  end

end
