defmodule Structs.Money do

  defstruct [:cents]

  def from("R$ " <> value) when is_binary(value) do

    with [int_part, decimal_part] <- String.split(value, [","]),
         int <- String.replace(int_part, ".", "") |> from_string_to_int(),
         decimal <- from_string_to_int(decimal_part) do

      %__MODULE__{cents: int * 100 + decimal}
    else
      _ -> :error_convert_money_to_cents
    end
  end

  def from(value) when is_integer(value), do: %__MODULE__{cents: value}

  def to_cents(%__MODULE__{cents: cents}), do: cents

  def to_cents(_value), do: :error_convert_money_to_cents

  def format(money = %__MODULE__{}, :cents), do: "#{to_cents(money)} cents"

  defp from_string_to_int(value) when is_binary(value) do
    {int, _decimal} = Integer.parse(value)
    int
  end

end