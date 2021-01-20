defmodule MoneyTest do
  use ExUnit.Case

  alias Structs.Money

  test "from/1 - valid money" do
    assert Money.from("R$ 0,00") == %Money{cents: 0}
    assert Money.from("R$ 33,33") == %Money{cents: 3333}

    assert Money.from(0) == %Money{cents: 0}
    assert Money.from(3333) == %Money{cents: 3333}
  end

  test "to_cents/1 - valid money" do
    assert Money.to_cents(%Money{cents: 0}) == 0
    assert Money.to_cents(%Money{cents: 70}) == 70
    assert Money.to_cents(%Money{cents: 170}) == 170
    assert Money.to_cents(%Money{cents: 172}) == 172
    assert Money.to_cents(%Money{cents: 1000}) == 1000
  end

  test "format/2 - valid cents" do
    assert Money.format(%Money{cents: 0}, :cents) == "0 cents"
    assert Money.format(%Money{cents: 70}, :cents) == "70 cents"
    assert Money.format(%Money{cents: 170}, :cents) == "170 cents"
    assert Money.format(%Money{cents: 172}, :cents) == "172 cents"
    assert Money.format(%Money{cents: 1000}, :cents) == "1000 cents"
  end
end
