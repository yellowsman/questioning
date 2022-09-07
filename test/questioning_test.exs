defmodule QuestioningTest do
  use ExUnit.Case
  doctest Questioning

  test "greets the world" do
    assert Questioning.hello() == :world
  end
end
