defmodule Schema do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:a, :b, :c]
  @primary_key false

  embedded_schema do
    field(:a, :integer)
    field(:b, :integer)
    field(:c, :integer)
  end

  def new(params) do
    %__MODULE__{}
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> try_to_apply()
  end

  defp try_to_apply(%{valid?: true} = changeset), do: apply_changes(changeset)
  defp try_to_apply(%{valid?: false, errors: errors}), do: {:error, errors}
end
