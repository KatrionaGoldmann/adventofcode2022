# Advent of Code 2022

Code written in an attempt to learn Ocaml. This readme really acts as my way of documenting my learning process.

---

## A bit about Ocaml

Ocaml is a general purpose programming language that is primarily used for functional programming.

Why Ocaml? In the Hut23 team we are trying to develop more functional programmers. 

---

## Setting up the Ocaml Project

```sh
dune init proj adventofcode
cd adventofcode
dune build
dune exec adventofcode
```

To view the documentation for the project, run:

```sh
dune build @doc
open _build/default/_doc/_html/index.html
```