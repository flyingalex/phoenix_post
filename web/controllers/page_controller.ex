defmodule PhoenixPost.PageController do
  use PhoenixPost.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
