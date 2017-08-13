defmodule Discuss.Web.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Discuss.Web.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss.Web do
    pipe_through :browser # Use the default browser stack

    get "/", TopicController, :index
    resources "/topics", TopicController
  end

  scope "/auth", Discuss.Web do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
  # Other scopes may use custom stacks.
  # scope "/api", Discuss.Web do
  #   pipe_through :api
  # end
end
