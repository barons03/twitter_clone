defmodule Twotter.TwootsTest do
  use Twotter.DataCase

  alias Twotter.Twoots

  describe "twoots" do
    alias Twotter.Twoots.Twoot

    @valid_attrs %{body: "some body"}
    @update_attrs %{body: "some updated body"}
    @invalid_attrs %{body: nil}

    def twoot_fixture(attrs \\ %{}) do
      {:ok, twoot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twoots.create_twoot()

      twoot
    end

    test "list_twoots/0 returns all twoots" do
      twoot = twoot_fixture()
      assert Twoots.list_twoots() == [twoot]
    end

    test "get_twoot!/1 returns the twoot with given id" do
      twoot = twoot_fixture()
      assert Twoots.get_twoot!(twoot.id) == twoot
    end

    test "create_twoot/1 with valid data creates a twoot" do
      assert {:ok, %Twoot{} = twoot} = Twoots.create_twoot(@valid_attrs)
      assert twoot.body == "some body"
    end

    test "create_twoot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twoots.create_twoot(@invalid_attrs)
    end

    test "update_twoot/2 with valid data updates the twoot" do
      twoot = twoot_fixture()
      assert {:ok, %Twoot{} = twoot} = Twoots.update_twoot(twoot, @update_attrs)
      assert twoot.body == "some updated body"
    end

    test "update_twoot/2 with invalid data returns error changeset" do
      twoot = twoot_fixture()
      assert {:error, %Ecto.Changeset{}} = Twoots.update_twoot(twoot, @invalid_attrs)
      assert twoot == Twoots.get_twoot!(twoot.id)
    end

    test "delete_twoot/1 deletes the twoot" do
      twoot = twoot_fixture()
      assert {:ok, %Twoot{}} = Twoots.delete_twoot(twoot)
      assert_raise Ecto.NoResultsError, fn -> Twoots.get_twoot!(twoot.id) end
    end

    test "change_twoot/1 returns a twoot changeset" do
      twoot = twoot_fixture()
      assert %Ecto.Changeset{} = Twoots.change_twoot(twoot)
    end
  end
end
