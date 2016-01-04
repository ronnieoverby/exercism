defmodule HelloWorld do
  def hello(name), do: "Hello, #{name}!"
  def hello, do: hello("World")
end
