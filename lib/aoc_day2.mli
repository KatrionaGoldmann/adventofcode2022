(** {1 Day 2}
    Its day 2 with the elves and we are playing rock-paper-scissors (RPS). 
    This module contains aset of functions to calculate RPS outcomes, 
    and the hand positions required to achieve such outcomes.

    {2 Rule Book:}
    - Rock beats Scissors 
    - Scissors beats Paper 
    - Paper beats Rock 
    *)

type outcome = Loss | Draw | Win
(** Constructor to define the possible types of match outcome.*)

type move = Rock | Paper | Scissors
(** Constructor to define the possible hand shapes or moves (RPS regulation).*)

val read_whole_file : string -> string list
(** Reads in the two-column input file line by line *)

val win_lose_draw : string -> string -> int
(** Function to determine the outcome of a RPS match, given the opponents hand and your own. *)

val hand_score : string -> int
(** Score of your hand: Rock=1; Paper=2; Scissors=3.*)

val total_score : int -> int -> int
(** Match score: outcome score (W/L/D) + hand score (R/P/S). *)

val end_game_score : string -> outcome
(** Re-code the input data to a possible match outcome. *)

val opponent_game_score : string -> move
(** Re-code the input data into the opponenet's hand moves or shapes.*)

val find_move : move * outcome -> move
(* Determine the hand move required to achieve and outcome, given the opponents hand. 
   From the RPS rule book *)

val score_match : move -> outcome -> int
(** The score of a given game (hand score + outcome score).*)