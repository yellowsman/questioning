defmodule Questioning.Score do
  @moduledoc """
  Questioning is a program for asking questions.
  """

  @doc """
  正答率を返す
  """
  @spec mark(time :: pos_integer(), correct :: pos_integer()) :: nil
  def mark(time, correct) do
    IO.puts("#{time}問中#{correct}問正解しました")
    IO.puts("正解率: #{trunc(Float.round((correct / time) * 100))}%")
  end
end
