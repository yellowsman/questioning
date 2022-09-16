defmodule Questioning.BuildQuestion do
  @moduledoc """
  Questioning is a program for asking questions.
  """
  

  @spec build(filepath :: String.t()) :: list(tuple())
  def build(filepath) do
    answer = Path.basename(filepath)
    data = File.read!(filepath)
           |> String.split("\n")
           |> Enum.reject(fn x -> String.trim(x) == "" end)
    Enum.map(data, fn x -> {x,answer} end)
  end
end
