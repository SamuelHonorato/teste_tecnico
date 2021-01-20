defmodule Playground do
  @moduledoc """
  Playground: mix run priv/playground.exs
  """

  alias Structs.{Item, Person}

  def run() do

    items = generate(:items)
    people = generate(:people)

    ShoppingList.calculate_value(items, people)
  end

  defp generate(:items) do
    [
      %Item{name: "Arroz", quantity: 10, price: "R$ 3,00", unity: :kg},
      %Item{name: "Feijão", quantity: 5, price: "R$ 8,98", unity: :kg},
      %Item{name: "Óleo de soja", quantity: 1, price: "R$ 6,75", unity: :un},
      %Item{name: "Kit de Sabonete", quantity: 3, price: "R$ 39,00", unity: :pkg}
    ]
  end

  defp generate(:people) do
    [
      %Person{email: "igorpaulothomasteixeira_@isometro.com.br"},
      %Person{email: "erickantoniosouza-93@tera.com.br"},
      %Person{email: "victorsergioheitorramos__victorsergioheitorramos@smalte.com.br"},
      %Person{email: "marcelavitoriaalinedamata__marcelavitoriaalinedamata@oas.com"},
      %Person{email: "diogofernandomarcossilva-95@redhouse.com.br"},
      %Person{email: "diogomarceloseverinonovaes..diogomarceloseverinonovaes@azulcargo.com.br"},
      %Person{email: "aliceestersales..aliceestersales@caiuas.com.br"}
    ]
  end

end

Playground.run() |> IO.inspect()