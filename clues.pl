% define the suspects, weapons, and rooms
suspect(scarlet).
suspect(green).
suspect(white).
suspect(mustard).
suspect(plum).
suspect(peacock).

weapon(leadpipe).
weapon(pistol).
weapon(rope).
weapon(wrench).
weapon(candlestick).
weapon(knife).

room(diningroom).
room(garage).
room(bedroom).
room(livingroom).
room(office).
room(gameroom).

% define the clues for each suspect, weapon, and room
clue(scarlet, scarlet_clue).
clue(green, green_clue).
clue(white, white_clue).
clue(mustard, mustard_clue).
clue(plum, plum_clue).
clue(peacock, peacock_clue).

clue(leadpipe, leadpipe_clue).
clue(pistol, pistol_clue).
clue(rope, rope_clue).
clue(wrench, wrench_clue).
clue(candlestick, candlestick_clue).
clue(knife, knife_clue).

clue(diningroom, diningroom_clue).
clue(garage, garage_clue).
clue(bedroom, bedroom_clue).
clue(livingroom, livingroom_clue).
clue(office, office_clue).
clue(gameroom, gameroom_clue).

% define the variables that will store the solution to the game
:- dynamic solution/3.

% the main predicate that plays the game
play :-
    write("Welcome to Clues! Please enter your findings after each turn."), nl,
    solve(Suspect, Weapon, Room),
    write("The solution is: "), write(Suspect), write(", "), write(Weapon), write(", "), write(Room).

% the solve predicate that tries to find the solution based on the clues
solve(Suspect, Weapon, Room) :-
    % try to find the solution based on the clues we have so far
    solution(Suspect, Weapon, Room), !.

solve(Suspect, Weapon, Room) :-
    % if we don't have a solution yet, ask the user for a clue and update the solution
    write("Enter a clue: "),
    read(Clue),
    (suspect(Suspect), clue(Suspect, Clue) -> assert(solution(Suspect, Weapon, Room)) ;
     weapon(Weapon), clue(Weapon, Clue) -> assert(solution(Suspect, Weapon, Room)) ;
     room(Room), clue(Room, Clue) -> assert(solution(Suspect, Weapon, Room)) ;
     write("Invalid clue. Please try again."), nl,
     solve(Suspect, Weapon, Room)).


