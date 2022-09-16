defmodule QuestioningTest do
  use ExUnit.Case
  doctest Questioning

  test "記述問題に正解する" do
    assert Questioning.describe() == nil
  end
  
  test "選択問題に正解する" do
    assert Questioning.choise() == nil
  end
end
