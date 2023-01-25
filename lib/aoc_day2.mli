(* Functions to calculate rock-paper-scissors outcomes*)

val read_whole_file : string -> string list
val win_lose_draw : string -> string -> int
val hand_score : string -> int
val total_score : int -> int -> int
type outcome = Loss | Draw | Win
type move = Rock | Paper | Scissors
val end_game_score : string -> outcome
val opponent_game_score : string -> move
val find_move : move * outcome -> move
val score_match : move -> outcome -> int