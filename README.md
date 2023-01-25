# Advent of Code 2022

Code written in an attempt to learn Ocaml. 
This repo is an exercise in setting up an ocaml project and this readme really outlines my process.

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

I then recommend completing the Stanza (package metadata) in the dune-project file. 
See [here](https://dune.readthedocs.io/en/stable/dune-files.html#dune-project) for more information about the details you can provide.

To enable browsable documentation, add an URL to the dune-project file, e.g.:

```sh
(documentation https://github.com/KatrionaGoldmann/adventofcode2022/issues)
```

You will need to re-install the project for this to take effect.

```sh
dune build
dune install

odig browse online-doc adventofcode
```