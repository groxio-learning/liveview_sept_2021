# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Echo.Repo.insert!(%Echo.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Echo.Library

Library.create_passage(%{
  name: "it",
  phrase: "have you tried turning it on and off again?",
  steps: 3})

Library.create_passage(%{
  name: "gump",
  phrase: "life is like a box of chocolates, you never know what you are going to get.",
  steps: 4})

Library.create_passage(%{
  name: "lincoln",
  phrase: "four score and seven years ago",
  steps: 6})

Library.create_passage(%{
  name: "incredibles",
  phrase: "I am your wife, I am the greatest good you are every going to get!",
  steps: 2})

Library.create_passage(%{
  name: "strikes-back",
  phrase: "do or do not, there is no try",
  steps: 2})
