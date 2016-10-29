defmodule PhoenixPost.Router do
  use PhoenixPost.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixPost do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/wechat", WechatController, :index
    get "/login", WechatController, :login
    
    # psot_path  GET     /psots           HelloPhoenix.PsotController :index
    # psot_path  GET     /psots/:id/edit  HelloPhoenix.PsotController :edit
    # psot_path  GET     /psots/new       HelloPhoenix.PsotController :new
    # psot_path  GET     /psots/:id       HelloPhoenix.PsotController :show
    # psot_path  POST    /psots           HelloPhoenix.PsotController :create
    # psot_path  PATCH   /psots/:id       HelloPhoenix.PsotController :update
             # PUT     /psots/:id       HelloPhoenix.PsotController :update
    # psot_path  DELETE  /psots/:id       HelloPhoenix.PsotController :delete
    resources "/posts", PostController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixPost do
  #   pipe_through :api
  # end
end
