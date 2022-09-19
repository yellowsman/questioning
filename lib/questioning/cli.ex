defmodule Questioning.CLI do
  @moduledoc """
  Questioning is a program for asking questions.
  """

  def main([]) do
    IO.puts "no args"
  end

  def main(args) when length(args) === 1 do
    [path] = args
             |> Enum.take(1)
    Questioning.describe(path)
  end

  # args は文字列のリストで受け取る
  def main(args) when length(args) === 2 do
    # データ型のチェックしたい
    [path, take] = args
                   |> Enum.take(2)
    
    Questioning.describe(path, String.to_integer(take))
  end

  def main(args) when length(args) >= 3 do
    IO.puts "too much args"
  end
end
