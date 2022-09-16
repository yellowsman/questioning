defmodule Questioning do
  @moduledoc """
  Questioning is a program for asking questions.
  """
  
  def describe(_target_dir \\ nil) do
    # 問題生成モジュール
    data = Questioning.BuildQuestion.build("script/test")

    Enum.each(data, fn x -> _run(x); IO.puts("") end)
  end

  defp _run(data) do
    Questioning.Question.show(data)
    Questioning.Answer.judge(data)
    |> IO.puts()
  end
end
