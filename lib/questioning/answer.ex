defmodule Questioning.Answer do
  @moduledoc """
  Questioning is a program for asking questions.
  """

  @doc """
  ユーザーから回答をもらって正答したかどうかを判定する
  """
  @spec judge(data :: tuple()) :: boolean()
  def judge({_question, answer}) do
    IO.gets("answer: ")
    |> String.trim()
    |> Kernel.===(answer)
    |> result()
  end

  defp result(true), do: "YES!"
  defp result(false), do: "Bad!"
end
