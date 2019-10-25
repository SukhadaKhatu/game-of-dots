defmodule GameOfDots.Login do

    def new() do
      %{
        tables: []
      }
    end

    def client_view(game) do
        game
      end
    
    def add_table(game, table) do
        new_table = [table]
        tables = Map.get(game, :tables)
        updated_tables = tables ++ new_table
        game = %{game | tables: updated_tables}
    end

    def join_table(game, table_name, player_name) do
      tables = Map.get(game, :tables)
      table = Enum.filter(tables, fn(x) -> x["name"] == table_name end)
      val = List.first(table)
      players = val["players"]
      new_players = players ++ [player_name]
      new_val = %{val | "players" => new_players}
      new_tables = Enum.map(tables, fn (table) -> if (table["name"] == table_name) do 
        table = new_val 
      else table = table  end end)  
      game = %{game | tables: new_tables}
    end
end