defmodule Echo.LibraryTest do
  use Echo.DataCase

  alias Echo.Library

  describe "passages" do
    alias Echo.Library.Passage

    @valid_attrs %{name: "some name", phrase: "some phrase", steps: 42}
    @update_attrs %{name: "some updated name", phrase: "some updated phrase", steps: 43}
    @invalid_attrs %{name: nil, phrase: nil, steps: nil}

    def passage_fixture(attrs \\ %{}) do
      {:ok, passage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Library.create_passage()

      passage
    end

    test "list_passages/0 returns all passages" do
      passage = passage_fixture()
      assert Library.list_passages() == [passage]
    end

    test "get_passage!/1 returns the passage with given id" do
      passage = passage_fixture()
      assert Library.get_passage!(passage.id) == passage
    end

    test "create_passage/1 with valid data creates a passage" do
      assert {:ok, %Passage{} = passage} = Library.create_passage(@valid_attrs)
      assert passage.name == "some name"
      assert passage.phrase == "some phrase"
      assert passage.steps == 42
    end

    test "create_passage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_passage(@invalid_attrs)
    end

    test "update_passage/2 with valid data updates the passage" do
      passage = passage_fixture()
      assert {:ok, %Passage{} = passage} = Library.update_passage(passage, @update_attrs)
      assert passage.name == "some updated name"
      assert passage.phrase == "some updated phrase"
      assert passage.steps == 43
    end

    test "update_passage/2 with invalid data returns error changeset" do
      passage = passage_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_passage(passage, @invalid_attrs)
      assert passage == Library.get_passage!(passage.id)
    end

    test "delete_passage/1 deletes the passage" do
      passage = passage_fixture()
      assert {:ok, %Passage{}} = Library.delete_passage(passage)
      assert_raise Ecto.NoResultsError, fn -> Library.get_passage!(passage.id) end
    end

    test "change_passage/1 returns a passage changeset" do
      passage = passage_fixture()
      assert %Ecto.Changeset{} = Library.change_passage(passage)
    end
  end
end
