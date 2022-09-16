defmodule Questioning do
  @moduledoc """
  Questioning is a program for asking questions.
  """
  
  def describe(target_dir, take \\ 10) do
    # 問題生成モジュール
    # data: 問題データのリスト
    data = File.ls!(target_dir)
           |> Enum.flat_map(fn x -> Questioning.BuildQuestion.build(Path.join(target_dir, x)) end)

    Enum.shuffle(data)
    |> Enum.take(take)
    |> Enum.each(fn x -> _run(x); IO.puts("") end)
  end

  defp _run(data) do
    Questioning.Question.show(data)

    Questioning.Answer.judge(data)
    |> IO.puts()
  end
end
