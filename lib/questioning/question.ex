defmodule Questioning.Question do
  @moduledoc """
  Question is a program for asking questions.
  """

  @doc """
  問題を出題する
  """
  @spec show(data :: tuple()) :: String.t()
  def show({question, _answer}) do
    IO.puts question
  end
end
