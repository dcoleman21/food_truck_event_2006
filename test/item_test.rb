require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/food_truck'

class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
  end

  def test_it_exists
    assert_instance_of Item, @item1
    assert_instance_of Item, @item2
  end


end
