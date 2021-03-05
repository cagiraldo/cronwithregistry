defmodule CronwithregistryWeb.PageController do
  use CronwithregistryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
