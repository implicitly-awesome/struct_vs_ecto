defmodule StructVsEcto do
  def run do
    Benchee.run(
      %{
        "Plain Struct" => fn -> Struct.new(%{"a" => 1, "b" => 2, "c" => 3}) end,
        "Ecto Schema" => fn -> Schema.new(%{"a" => 1, "b" => 2, "c" => 3}) end
      },
      time: 5,
      print: [fast_warning: false]
    )
  end
end
