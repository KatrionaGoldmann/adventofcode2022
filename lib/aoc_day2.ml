(* https://adventofcode.com/2022/day/2 *)
(* input data: https://adventofcode.com/2022/day/2/input *)



(* Read the input file line by line *)
let read_whole_file filename =
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true; do
      lines := input_line chan :: !lines
    done; []
  with End_of_file ->
    close_in chan;
    List.rev !lines
  ;;

(* ---------- Part 1 ---------- *)
(* calculate the outcome of the game*)

(* function to decide if win, lose, or draw *)
let win_lose_draw (opponent: string) (me: string) : int =
  if opponent = "A" && me = "Z" then 0      (* Rock beats Scissors -> lose *)
  else if opponent = "C" && me = "Y" then 0 (* Scissors beats Paper -> lose *)
  else if opponent = "B" && me = "X" then 0 (* Paper beats Rock -> lose *)
  else if opponent = "A" && me = "Y" then 6 (* Rock loses to Paper -> win*)
  else if opponent = "C" && me = "X" then 6 (* Scissors loses to Rock -> win*)
  else if opponent = "B" && me = "Z" then 6 (* Paper loses to Scissors -> win*)
  else 3 ;;  (* Draw *)

(* calculate the hand score*)
let hand_score (me: string) : int =
  if me = "X" then 1 (* Rock*)
  else if me = "Y" then 2 (* Paper*)
  else 3 ;; (* Scissors *)

let total_score (hand: int) (game: int) : int =  hand + game ;;



(* ---------- Part 2 ---------- *)
(* Determine the hand you need to play, and recalculate score*)

(* Lets try with constructors*)
type outcome = Loss | Draw | Win
type move = Rock | Paper | Scissors

(* Refactor what I need to do as: X = Lose, Y = Draw, Z = Win*)
let end_game_score (me: string) : outcome =
  if me = "X" then Loss else if me = "Y" then Draw else Win ;; 


(* Refactor the opponents hand into 'moves': A= Rock, B=Paper, C=scissors*)
let opponent_game_score (opp: string) : move =
  if opp = "A" then Rock else if opp = "B" then Paper else Scissors ;; 


(* The Rock-Paper-Scissors rule book *)
let find_move (opponent, outcome) =
  match (opponent, outcome) with
  | Rock, Draw | Paper, Loss | Scissors, Win -> Rock
  | Rock, Win | Paper, Draw | Scissors, Loss -> Paper
  | Rock, Loss | Paper, Win | Scissors, Draw -> Scissors
;;

(* Calculate the score, given the opponents have and the outcome*)
let score_match (opponent: move) (outcome: outcome) : int =
  let me = find_move (opponent, outcome) in
  let shape_score = match me with Rock -> 1 | Paper -> 2 | Scissors -> 3 in
  let outcome_score = match outcome with Loss -> 0 | Draw -> 3 | Win -> 6 in
  shape_score + outcome_score
;;



