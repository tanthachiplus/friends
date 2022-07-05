defmodule Friends.Repo.Migrations.CreateAddProcerduce do
  use Ecto.Migration

  def change do
    execute """
    create or replace function add(a int, b int)
    returns int
    language plpgsql
    as
    $$
    begin
      return a + b;
    end;
    $$;
    """

    execute """
    create or replace procedure add_age()
    language plpgsql
    as $$
    begin
        -- subtracting the amount from the sender's account
        update people
        set age = age + 1
        where id = 3;

        commit;
    end;$$;
    """
  end
end
