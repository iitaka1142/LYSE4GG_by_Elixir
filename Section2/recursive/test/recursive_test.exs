defmodule RecursiveTest do
  use ExUnit.Case

  #  test "the truth" do
  #    assert(true)
  #  end

  test "fac/1: 0! = 1" do
    assert(Recursive.fac(0) == 1)
  end

  test "fac/1: 2! = 2" do
    assert(Recursive.fac(2) == 2)
  end

  test "fac/1: 5! = 120" do 
    assert(Recursive.fac(5) == 120)
  end

  test "len/1: [] => 0" do
    assert(Recursive.len([]) == 0)
  end

  test "len/1: [1,2,3] => 3" do
    assert(Recursive.len([1,2,3]) == 3)
  end

  test "tail_fac/1: 0! = 1" do
    assert(Recursive.tail_fac(0) == 1)
  end

  test "tail_fac/1: 2! = 2" do
    assert(Recursive.tail_fac(2) == 2)
  end

  test "tail_fac/1: 5! = 120" do
    assert(Recursive.tail_fac(5) == 120)
  end

  # when I tried to use private function, compile error raised. 
  #test "tail_fac/2: can't use since it is private" do 
  #  assert_raise(CompileError, tail_fac(0, 1))
  #end

  test "tail_len/1: [] => 0" do
    assert(Recursive.tail_len([]) == 0)
  end

  test "tail_len/1: [1,2,3] => 3" do
    assert(Recursive.tail_len([1,2,3]) == 3)
  end

end

import :gb_trees # use this one if you don't want to write module name every time

defmodule TreeTest do
  use ExUnit.Case

  test "create empty tree" do
    assert(Tree.empty() == {:node, :nil})
  end

  test "insert to nil" do
    assert(Tree.insert(1, 'a', Tree.empty()) == {:node, {1, 'a', {:node, :nil}, {:node, :nil}}})
  end

  test "insert same key" do
    init_tree = {:node, {1, 'a', {:node, :nil}, {:node, :nil}}}
    assert(Tree.insert(1, 'b', init_tree) == {:node, {1, 'b', {:node, :nil}, {:node, :nil}}})
  end

  test "insert smaller key" do
    init_tree = {:node, {3, 'c', {:node, :nil}, {:node, :nil}}}
    assert(Tree.insert(1, 'a', init_tree) == {:node, {3, 'c', {:node, {1, 'a', {:node, :nil}, {:node, :nil}}}, {:node, :nil}}})
  end

  test "insert larger key" do
    init_tree = {:node, {3, 'c', {:node, :nil}, {:node, :nil}}}
    assert(Tree.insert(5, 'f', init_tree) == {:node, {3, 'c', {:node, :nil}, {:node, {5, 'f', {:node, :nil}, {:node, :nil}}}}})
  end

  test "lookup to empty tree" do
    assert(Tree.lookup(1, Tree.empty()) == {:undefined})
  end

  test "lookup then find" do
    target_tree = {:node, {2, 'b', {:node, {1, 'a', {:node, :nil}, {:node, :nil}}}, {:node, {3, 'c', {:node, :nil}, {:node, :nil}}}}}
    assert(Tree.lookup(2, target_tree) == {:ok, 'b'})
  end

  test "lookup then find at not root node" do
    target_tree = {:node, {2, 'b', 
        {:node, {1, 'a', {:node, :nil}, {:node, :nil}}}, {:node, {3, 'c', {:node, :nil}, {:node, :nil}}}}}
    assert(Tree.lookup(1, target_tree) == {:ok, 'a'})
    assert(Tree.lookup(3, target_tree) == {:ok, 'c'})
  end

  test "use gb_trees that is one of erlang std library" do
    empty = empty() # use erlang std module
    # :gb_trees.empty() # use erlang std module in full name format
    assert(empty == {0, :nil})
  end

end
