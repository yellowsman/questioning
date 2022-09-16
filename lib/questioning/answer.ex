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
    |> sanitize()
    |> Kernel.then(&String.starts_with?(sanitize(answer), &1))
    |> result(answer)
  end

  defp result(true, ans), do: "YES!: " <> ans
  defp result(false, ans), do: "Bad!: " <> ans

  defp sanitize(word), do: word |> String.downcase() |> String.replace(" ", "")
end
