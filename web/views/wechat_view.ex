defmodule PhoenixPost.WechatView do
  use PhoenixPost.Web, :view

  def render("index.json", %{response: response}) do
    %{response: response}
  end
end