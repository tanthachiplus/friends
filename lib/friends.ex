defmodule Friends do
  import Ecto.Query
  @moduledoc """
  Documentation for `Friends`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Friends.hello()
      :world

  """
  def hello do
    :world
  end

  def direct_query() do
    # use to build direct query call
    Ecto.Adapters.SQL.query(Friends.Repo, "select * from add($1, $2);", [1, 2])
  end

  def direct_procerduce() do
    # use to build direct query call
    Ecto.Adapters.SQL.query(Friends.Repo, "CALL add_age();")
  end

  def build_fragment() do
    # get person with id 3
    from(u in Friends.Person)
    |> where(id: fragment("add(\?, \?)", 1, 2))
    |> Friends.Repo.all()
  end

end
