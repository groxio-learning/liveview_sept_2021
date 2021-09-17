# defmodule Echo.GameTest do
#   use Echo.DataCase

#   alias Echo.Game

#   describe "erasers" do
#     alias Echo.Game.Eraser

#     @valid_attrs %{name: "some name", phrase: "some phrase", steps: 42}
#     @update_attrs %{name: "some updated name", phrase: "some updated phrase", steps: 43}
#     @invalid_attrs %{name: nil, phrase: nil, steps: nil}

#     def eraser_fixture(attrs \\ %{}) do
#       {:ok, eraser} =
#         attrs
#         |> Enum.into(@valid_attrs)
#         |> Game.create_eraser()

#       eraser
#     end

#     test "list_erasers/0 returns all erasers" do
#       eraser = eraser_fixture()
#       assert Game.list_erasers() == [eraser]
#     end

#     test "get_eraser!/1 returns the eraser with given id" do
#       eraser = eraser_fixture()
#       assert Game.get_eraser!(eraser.id) == eraser
#     end

#     test "create_eraser/1 with valid data creates a eraser" do
#       assert {:ok, %Eraser{} = eraser} = Game.create_eraser(@valid_attrs)
#       assert eraser.name == "some name"
#       assert eraser.phrase == "some phrase"
#       assert eraser.steps == 42
#     end

#     test "create_eraser/1 with invalid data returns error changeset" do
#       assert {:error, %Ecto.Changeset{}} = Game.create_eraser(@invalid_attrs)
#     end

#     test "update_eraser/2 with valid data updates the eraser" do
#       eraser = eraser_fixture()
#       assert {:ok, %Eraser{} = eraser} = Game.update_eraser(eraser, @update_attrs)
#       assert eraser.name == "some updated name"
#       assert eraser.phrase == "some updated phrase"
#       assert eraser.steps == 43
#     end

#     test "update_eraser/2 with invalid data returns error changeset" do
#       eraser = eraser_fixture()
#       assert {:error, %Ecto.Changeset{}} = Game.update_eraser(eraser, @invalid_attrs)
#       assert eraser == Game.get_eraser!(eraser.id)
#     end

#     test "delete_eraser/1 deletes the eraser" do
#       eraser = eraser_fixture()
#       assert {:ok, %Eraser{}} = Game.delete_eraser(eraser)
#       assert_raise Ecto.NoResultsError, fn -> Game.get_eraser!(eraser.id) end
#     end

#     test "change_eraser/1 returns a eraser changeset" do
#       eraser = eraser_fixture()
#       assert %Ecto.Changeset{} = Game.change_eraser(eraser)
#     end
#   end
# end
