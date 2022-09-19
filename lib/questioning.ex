defmodule Questioning do
  @moduledoc """
  Questioning is a program for asking questions.
  """
  
  @spec describe(targt_dir :: Path.t(), take :: pos_integer()) :: nil
  def describe(target_dir, take \\ 10) do
    # 問題生成モジュール
    # data: 問題データのリスト
    data = File.ls!(target_dir)
           |> Enum.flat_map(fn x -> Questioning.BuildQuestion.build(Path.join(target_dir, x)) end)

    questions = Enum.shuffle(data)
                |> Enum.take(take)

    corrects = questions 
               |> Enum.map(fn x -> _run(x); end)

    Questioning.Score.mark(Enum.count(questions), Enum.count(corrects, &(&1 === true)))
  end

  defp _run(data) do
    Questioning.Question.show(data)

    Questioning.Answer.judge(data)
    |> Kernel.tap(fn x -> Questioning.Answer.show_result(x, elem(data, 1)) |> IO.puts() end)
    |> Kernel.tap(fn _ -> IO.puts("") end)
  end
end
