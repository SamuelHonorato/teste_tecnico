defmodule ShoppingList do
  @moduledoc """
  Documentation for `ShoppingList`.
  """

  alias Structs.Money

  def calculate_value(items, people) do
    list_values_by_email =
      total_price(items, :cents)
      |> division_of_the_total_price(Enum.count(people))

    case list_values_by_email do
      :error_empty_email_list -> raise "Oops. Empty email list!"
      _ -> merge_emails_with_values(list_values_by_email, people)
    end
  end

  def total_price(list_items, :cents) do
    Enum.map(list_items, fn item -> item.quantity * (Money.from(item.price) |> Money.to_cents()) end)
    |> Enum.reduce(0, fn item_value, acc -> item_value + acc end)
  end

  def division_of_the_total_price(_, 0), do: :error_empty_email_list

  def division_of_the_total_price(total, quantity) do
    tail_length = quantity - 1

    {tail_value, _} = total / quantity |> Float.to_string() |> Integer.parse()
    list_tail = Money.from(tail_value) |> List.duplicate(tail_length)

    head_value = total - (tail_value * tail_length)
    list_head = [Money.from(head_value)]

    list_head ++ list_tail
  end

  def merge_emails_with_values(values, people) do
    Enum.zip(people, values)
    |> Enum.map(fn {person, money} -> {person.email, Money.format(money, :cents)} end)
    |> Map.new()
  end

end
