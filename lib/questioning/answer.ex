defmodule Questioning.Answer do
  @moduledoc """
  Questioning is a program for asking questions.
  """

  @doc """
  ユーザーから回答をもらって正答したかどうかを判定する
  """
  # typescpe通りに返せてねえ
  @spec judge(data :: tuple()) :: boolean()
  def judge({_question, correct}) do
    IO.gets("answer: ") 
    |> String.trim()
    |> _judge(correct)
  end

  @spec show_result(result :: boolean(), answer :: String.t()) :: String.t()
  def show_result(true, ans), do: "YES!: " <> ans
  def show_result(false, ans), do: "Bad!: " <> ans


  defp _judge("", _), do: false
  defp _judge(answer, correct) do
    String.starts_with?(sanitize(correct), sanitize(answer))
  end

  defp sanitize(word), do: word |> String.downcase() |> String.replace(" ", "")
end
