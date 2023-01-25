(* https://adventofcode.com/2022/day/1 *)
(* input data: https://adventofcode.com/2022/day/1/input *)



(* Read the input file *)
let read_whole_file filename =
  let ch = open_in filename in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s;;





