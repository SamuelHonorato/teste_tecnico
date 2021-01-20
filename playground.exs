defmodule Playground do
  @moduledoc """
  Playground: mix run priv/playground.exs
  """

  alias Structs.{Item, Money, Person}

  def run() do

    items = generate(:items)
    people = generate(:people)

    list_values_by_email =
      ShoppingList.total_price(items, :cents)
      |> ShoppingList.division_of_the_total_price(Enum.count(people))

    case list_values_by_email do
      value when is_list(value) ->
        ShoppingList.merge_emails_with_values(list_values_by_email, people)
        |> Enum.map(fn {person, money} -> {person.email, Money.format(money, :cents)} end)
        |> Map.new()
      :error_empty_email_list -> raise "Oops. Empty email list!"
      _ -> raise "Error"
    end
  end

  def generate(:items) do
    [
      %Item{name: "Arroz", quantity: 10, price: "R$ 3,00", unity: :kg},
      %Item{name: "Feijão", quantity: 5, price: "R$ 8,98", unity: :kg},
      %Item{name: "Óleo de soja", quantity: 1, price: "R$ 6,75", unity: :un},
      %Item{name: "Kit de Sabonete", quantity: 3, price: "R$ 39,00", unity: :pkg}
    ]
  end

  def generate(:people) do
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