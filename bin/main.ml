open Adventofcode

let day1 () = 
  let input_data = Aoc_day1.read_whole_file "/Users/kgoldmann/Documents/Projects/adventofcode/data/input_aoc_day1.txt" in
  (* Split by new lines *)     

  (* Calculate the calories for each elf *)
  let calories_per_elf =  input_data
    |> Str.split (Str.regexp "\n\n") (* Split string by new line*)
    |> List.map (String.split_on_char '\n')  (* group splits into list *)
    |> List.map (List.map int_of_string) (* convert to number*)
    |> List.map (List.fold_left (+) 0) in (* get the sum of all calories*) 
    
  (* Part 1*)
  let max_calories = calories_per_elf 
    |> List.fold_left max min_int in

  (* Part 2*)
  let top_3 =calories_per_elf
    |> List.sort (fun a b -> Int.compare b a)
    |> List.to_seq 
    |> Seq.take 3 in
    
  (* print max calories*)
  print_endline ("\n---------- Day 1 ----------" ) ;
  print_endline ("- Part 1 solution: " ^ string_of_int max_calories) ;
  print_endline ("- Part 2 solution: " ^ (Seq.fold_left (+) 0 top_3 |> string_of_int) ) ;;
 

let () = day1 ()

let day2 (file: string) = 
  (* Import the data*)
  let input_data = Aoc_day2.read_whole_file file in
  let opponent_column = List.map (fun x -> String.sub x 0 1) input_data in
  let my_hand_column = List.map (fun x -> String.sub x 2 1) input_data in
  let game_outcome = List.map2 Aoc_day2.win_lose_draw opponent_column my_hand_column in
  let hand_outcome = List.map Aoc_day2.hand_score my_hand_column in

  (* calculate the score, part 1 *)  
  let total = List.map2 Aoc_day2.total_score hand_outcome game_outcome 
    |>List.fold_left (+) 0 in

  (* determine my hand, part 2*)
  let end_game_outcome = List.map Aoc_day2.end_game_score my_hand_column in
  let opponent_game_outcome = List.map Aoc_day2.opponent_game_score opponent_column in
  let total_score = List.map2 Aoc_day2.score_match opponent_game_outcome end_game_outcome 
    |> List.fold_left (+) 0 in
  
  print_endline ("---------- Day 2 ----------" ) ;
  print_endline ("- Part 1 solution: " ^ string_of_int total) ;
  print_endline ("- Part 2 solution: " ^ string_of_int total_score) ;; 
  
let () = day2 ("/Users/kgoldmann/Documents/Projects/adventofcode/data/input_aoc_day2.txt")