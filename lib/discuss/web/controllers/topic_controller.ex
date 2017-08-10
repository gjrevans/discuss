defmodule Discuss.Web.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic
  alias Discuss.Repo

  def index(conn, _params) do
    topics = Repo.all(Topic)
    conn
    |> assign(:topics, topics)
    |> render("index.html")
  end

  def new(conn, _params) do
    conn
    |> assign(:changeset, Topic.changeset(%Topic{}))
    |> render("new.html")
  end

  def create(conn, %{"topic" => topic}) do
   changeset = Topic.changeset(%Topic{}, topic)

   case Repo.insert(changeset) do
     {:ok, _topic} ->
       conn
       |> put_flash(:info, "Topic Created")
       |> redirect(to: topic_path(conn, :index))
     {:error, changeset} ->
       conn
       |> assign(:changeset, changeset)
       |> put_flash(:error, "Topic was not created")
       |> render("new.html")
   end
  end

  def edit(conn, %{"id" => topic_id}) do
    topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(topic)

    conn
    |> assign(:topic, topic)
    |> assign(:changeset, changeset)
    |> render("edit.html")
  end

  def update(conn, %{"id" => topic_id, "topic" => topic}) do
    old_topic = Repo.get(Topic, topic_id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
    {:ok, _topic} ->
      conn
      |> put_flash(:info, "Topic Updated")
      |> redirect(to: topic_path(conn, :index))
    {:error, changeset} ->
      conn
      |> assign(:topic, old_topic)
      |> assign(:changeset, changeset)
      |> put_flash(:error, "Topic was not created")
      |> render("new.html")
    end
  end

  def delete(conn, %{"id" => topic_id}) do
    Repo.get!(Topic, topic_id) |> Repo.delete!

    conn
    |> put_flash(:info, "Topic Deleted")
    |> redirect(to: topic_path(conn, :index))
  end
end
