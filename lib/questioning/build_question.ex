defmodule Questioning.BuildQuestion do
  @moduledoc """
  Questioning is a program for asking questions.
  """
  

  def build(filepath) do
    answer = Path.basename(filepath)
    data = File.read!(filepath)
           |> String.split
    Enum.map(data, fn x -> {x,answer} end)
  end
end
