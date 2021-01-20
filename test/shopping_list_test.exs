defmodule ShoppingListTest do
  use ExUnit.Case
  doctest ShoppingList

  alias Structs.{Item, Money}

  setup do
    list_items =
      [
        %Item{name: "Produto1", quantity: 1, price: "R$ 14,99", unity: :kg},
        %Item{name: "Produto2", quantity: 1, price: "R$ 11,01", unity: :un},
        %Item{name: "Produto3", quantity: 1, price: "R$ 13,00", unity: :pkg}
      ]

    %{list_items: list_items}
  end

  test "total_price/2 - valid", %{list_items: list_items} do
    assert ShoppingList.total_price(list_items, :cents) == 3900
  end

  test "division_of_the_total_price/2" do
    assert ShoppingList.division_of_the_total_price(100, 0) == :error_empty_email_list
    assert ShoppingList.division_of_the_total_price(100, 3) == [%Money{cents: 34}, %Money{cents: 33}, %Money{cents: 33}]
  end
end
