INCLUDE Irvine32.inc
includelib Winmm.lib

PlaySound PROTO, ;prototype for PlaySound function
        pszSound:PTR BYTE, 
        hmod:DWORD, 
        fdwSound:DWORD

.data
themeSound db "pacman_beginning.wav", 0 
gameoverSound db "pacman_death.wav", 0
DotSound db "waka.wav", 0
username_label  BYTE "Username: ", 0
space_str       BYTE " ", 0


welcome_screen  byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0
                byte "                                  XXXXXXXX XXXXXXX  XXXXXX X          X  XXXXXXXX X         X                           ",0 
                byte "                                  X      X X     X  X      X X      X X  X      X X X       X                           ",0
                byte "                                  X      X X     X  X      X   X  X   X  X      X X   X     X                           ",0
                byte "                                  XXXXXXXX XXXXXXX  X      X    X     X  XXXXXXXX X     X   X                           ",0
                byte "                                  X        X     X  X      X          X  X      X X       X X                           ",0
                byte "                                  X        X     X  XXXXXX X          X  X      X X         X                           ",0
                byte "                                                                                                                        ",0
                byte "                                                                                                                        ",0

menu_screen     byte "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",0
                byte "                                                                                                                     ",0
                byte "                                                                                                                     ",0
                byte "                          X      X XXXXXX X       X X    X                                                           ",0
                byte "                          X X  X X X      X X     X X    X                                                           ",0
                byte "                          X   X  X XXXXXX X   X   X X    X                                                           ",0
                byte "                          X      X X      X     X X X    X                                                           ",0
                byte "                          X      X XXXXXX X       X XXXXXX                                                           ",0
                byte "                                                                                                                     ",0 
                byte "                                                                                                                     ",0
                byte "                          - PRESS i TO GO TO INSTRUCTIONS SCREEN                                                     ",0
                byte "                          - PRESS 1 TO PLAY LEVEL 1                                                                  ",0
                byte "                          - PRESS 2 TO PLAY LEVEL 2                                                                  ",0
                byte "                          - PRESS 3 TO PLAY LEVEL 3                                                                  ",0
                byte "                          - PRESS s TO VIEW SCORES                                                                   ",0
                byte "                          - PRESS X TO QUIT                                                                          ",0
                byte "                                                                                                                     ",0
                byte "                                                                                                                     ",0
                byte "                                          GOOD LUCK !!                                                               ",0

view_scores_msg BYTE "SCORES:", 0
no_scores_msg BYTE "No scores recorded yet!", 0

instruction_screen  byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                          x x     x xxxxx  xxxxx xxxxx x   x xxxxx  xxxxx  x  xxxx  x      x xxxxx            ",0
                    byte "                          x x x   x x        x   x   x x   x x        x    x  x  x  x x    x x                ",0
                    byte "                          x x  x  x xxxxx    x   xxxxx x   x x        x    x  x  x  x   x  x xxxxx            ",0
                    byte "                          x x   x x     x    x   x x   x   x x        x    x  x  x  x    x x     x            ",0
                    byte "                          x x     x xxxxx    x   x   x xxxxx xxxxx    x    x  xxxx  x      x xxxxx            ",0                                
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                             - USE W TO MOVE UP            - USE S TO MOVE DOWN                               ",0
                    byte "                             - USE A TO MOVE LEFT          - USE D TO MOVE RIGHT                              ",0
                    byte "                             -USE B TO MOVE BACK TO MENU   - PRESS S TO SHOW SCORE                            ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
                    byte "                                                                                                              ",0
           
level1_map db "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0
	        db "                                                                                                               ",0
	        db "            ................... 0000000                               00000000 .......................         ",0
	        db "00         ....................0000000  .. ..        00       ..   . 00000000 ........................     000",0
	        db "00                              0000000  .. ..     000000000   ..   . 00000000                               00",0
	        db "0           ....................0000000  .. ..                 ..   . 00000000.........................       0",0
	        db "0           ....................0000000  .. ..        00       ..   . 00000000.........................       0",0
	        db "00                 00000........         .. ..        00       ..   .                             00000       0",0
	        db "000                00000 ........        .. ..                 ..   .                 LEVEL 1     00000      00",0
	        db "                   00000000000000 .       000000000  SCORE:          0000000000           00000000000000    000",0
	        db "  .......................... 0000 .       000000000              0000000000 ...   .  0000                      ",0
	        db "............       ......... 0000 .     . ....                              ...   .  0000                      ",0
	        db "000                                      .                                                                  000",0
	        db "000                           0....              .........................         .                        000",0
	        db "0 ......................     0000       . 0..............................   ..        0000  ..... ............0",0
	        db "0 ......................     0000         0    0000000 ...    ... 0000000 0 .. .  .   0000    ............... 0",0
	        db "............... .0000000000000000                                                    0000            ........ 0",0
	        db "000000000000000000000000                       0000000 ...    ....0000000    .  .  .  000000000000000........ 0",0
	        db "0                 000000 .............. 000000000000000 .......   0000000000000000               0000........ 0",0
	        db "0     2099        000000 .............                                                           00000 ...... 0",0        
	        db "0                 0                     ............................             ................00           0",0
	        db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0

level2_map db "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0
          db "                                                                                                                      ",0
          db "000000      ...................                                                  ........................      000000",0
          db "000000      ....................0000000  ..  ..         00       ..   . 00000000 ........................      000000",0
          db "000000             *   0000000000000000  ..  ..      000000000   ..   . 0000000000000000000                    000000",0
          db "000000      ....................0000000  ..  ..                  ..   . 00000000.........................      000000",0
          db "000000      ....................0000000  ..  ..         00       ..   . 00000000.........................      000000",0
          db "000000             00000........         ..  ..         00       ..   .                             00000      000000",0
          db "000000             00000 ........        ..  ..                  ..   .           *     LEVEL 2     00000      000000",0
          db "000000             00000000000000 .       000000000  SCORE:          0000000000           00000000000000       000000",0
          db "000000 ..................... 0000 .       000000000              0000000000 ....      0000                     000000",0
          db "000000 ..................... 0000 .     . 0        0             0        0 ....      0000                     000000",0
          db "000000                       0000 .     . 0                                           0000                     000000",0
          db "000000                       0000 .     . 0..............   ............. 0           0000                     000000",0
          db "0 ......................     0000 .     . 0..............   ............. 0           0000    ......................0",0
          db "0 ......................     0000 *       0    0000000 ...    ... 0000000 0           0000    ..................... 0",0
          db "............... .0000000000000000              0000000 ...    ... 0000000             0000                 ........ 0",0
          db "000000000000000000000000                       0000000 ...    ....0000000      000000000000000      ........ 0",0
          db "0                 000000 .............. 000000000000000 .......   0000000000000000               00000     ........ 0",0
          db "0    2099         000000 .............  000000000000000           0000000000000000               00000     ........ 0",0        
          db "0                 0                       .............................           ................                   0",0
          db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0

level3_map db "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0
          db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0
          db "000000      ................... 0000000                                 00000000 ........................      000000",0
          db "000000      ....................0000000  . . . .        00       . .  . 00000000 ........................      000000",0
          db "000000      000000000000000000000000000  . . . .     000000000   . .  . 000000000000000000000000000000000      000000",0
          db "000000      ....................0000000  . . . .         $       . .  . 00000000.........................      000000",0
          db "000000      ....................0000000  . . . .        00       . .  . 00000000.........................      000000",0
          db "000000             00000........         . . . .        00       . .  .                             00000      000000",0
          db "000000             00000 ........        . . . .                 . .  .                 LEVEL 3     00000      000000",0
          db "000000             00000000000000 .       000000000    SCORE:    0000000000*          00000000000000           000000",0
          db "000000 ..................... 0000 .       000000000              0000000000 . . .  .  0000                     000000",0
          db "000000 ..................... 0000 .     . 0        0             0        0 . . .  .  0000                   * 000000",0
          db "0000000000000000000000000    0000 .     . 0        000000000000000        0 . . .  .  0000    00000000000000000000000",0
          db "0000000000000000000000000    0000 .     . 0.............................. 0 . . .  .  0000    00000000000000000000000",0
          db "0 ......................     0000 .     . 0.............................. 0 . . .  .  0000    ......................0",0
          db "0 ......................     0000         0    0000000 ...    ... 0000000 0 . . .  .  0000    ..................... 0",0
          db "000000000000000000000000000000000              0000000 ...    ... 0000000   . . .  .  0000                 ........ 0",0
          db "0               000000                         0000000 ...    ....0000000    .  .  .  000000000000000      ........ 0",0
          db "0    2099       000000 ................ 000000000000000 .......   0000000000000000               00000     ........ 0",0
          db "0               000000 ...............  000000000000000           0000000000000000       $       00000     ........ 0",0        
          db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0
          db "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",0

name_input_prompt byte "                                        Enter your name: ",0
fileName     BYTE "user_names.txt", 0
userName     BYTE 100 DUP(0)         ; buffer for storing name
fileHandle   DWORD ?
user_choice byte ?
gameover_msg db 'Game Over! Press any key to exit...', 0
win_msg byte "YOU WIN! Press any key to exit...", 0
lives_msg byte "Lives: ", 0
score word 0
pacman byte "X", 0   ;i show pacman/player by X
pacman_x db 7  ;initial pacman positions 
pacman_y db 4

ghostxpos byte 40        ; initial position of ghost 
ghostypos byte 8         

ghostdirection db ?      ; 0=up, 1=down, 2=right, 3=left     

lives byte 3            ; player starts with 3 lives

game_over_msg byte "GAME OVER! Press any key to exit...", 0

; Power fruit variables
power_fruit_x byte 40     ;initial positions of power fruit whcih allow pacman to eat ghost and win 
power_fruit_y byte 12     
power_active byte 0       ; check for power fruit activation
power_timer byte 0        ; controls the amount o time power fruit will stay on

power_active_msg byte "POWER: ", 0
power_active_char byte "ON ", 0
power_inactive_char byte "OFF", 0

cherry_x byte 40     ;initial positions of cherry which increases life by 1
cherry_y byte 12     

score_file BYTE "new_scores.txt", 0  ; Simple relative path
score_buffer BYTE "Level ", 0
score_buffer2 BYTE " - Score: ", 0
score_handle DWORD ?
current_level BYTE 1    ; Track current level

debug_msg1 BYTE "Attempting to save score...", 0
debug_msg2 BYTE "Score saved successfully!", 0
debug_msg3 BYTE "Error saving score!", 0
debug_msg4 BYTE "File contents:", 0
debug_msg5 BYTE "Error opening file!", 0
debug_msg6 BYTE "Error writing to file!", 0
debug_msg7 BYTE "Error reading file!", 0
debug_msg8 BYTE "Current directory: ", 0
file_buffer BYTE 200 DUP(0)  ; Buffer for reading file contents

.code

display_welcome_screen PROC
mov esi, OFFSET welcome_screen ;start of welcome screen array
mov ecx, 16     ; total lines in welcome array

printLoop:
    mov edx, esi   
    cmp ecx, 16   
    je print_boundary
    cmp ecx, 7   ;if we reached line containing welcome
    je blue_print  
    cmp ecx, 6
    je blue_print
    cmp ecx, 5
    je blue_print
    cmp ecx, 4
    je blue_print
    cmp ecx, 3
    je blue_print
    cmp ecx, 2
    je blue_print
    cmp ecx, 1 
    je print_boundary

blue_print:
    mov eax, blue + (black * 16)
    call SetTextColor
    call WriteString
    call Crlf
    jmp continue_loop

print_boundary:
    mov eax, magenta
    call SetTextColor
    call WriteString
    call Crlf
    mov eax, white             ;reset colors
    call SetTextColor 
    jmp continue_loop

print_simple:
    mov eax, white
    call SetTextColor
    call WriteString
    call Crlf
    jmp continue_loop

continue_loop:
 
nextString:
    mov al, [esi] ;Move ESI to next string to scan until we find null termintor
    cmp al, 0
    je foundNull
    inc esi
    jmp nextString

foundNull:
    inc esi          ; skip over the null terminator
    dec ecx
    jnz printLoop
ret
display_welcome_screen ENDP

get_name_input PROC
mov edx, OFFSET name_input_prompt
call WriteString
mov edx, OFFSET userName
mov ecx, 99               ; max characters
call ReadString

; Open or create file
mov edx, OFFSET fileName
call CreateOutputFile     ; returns handle in EAX
mov fileHandle, eax

; Write name to file
mov edx, OFFSET userName
call StrLength ;eax=length
mov ecx, eax
mov eax, fileHandle
mov edx, OFFSET userName
call WriteToFile    ; writes null-terminated string to file

; Write newline after name
mov edx, OFFSET CrLf
mov ecx, 2
mov eax, fileHandle
call WriteToFile

; Close the file
mov eax, fileHandle
call CloseFile
ret
get_name_input ENDP

display_menu_screen PROC
    mov esi, OFFSET menu_screen
    mov ecx, 18

printLoop:
    mov edx, esi   
    cmp ecx, 15   
    je blue_print  
    cmp ecx, 14
    je blue_print
    cmp ecx, 13
    je blue_print
    cmp ecx, 12
    je blue_print
    cmp ecx, 11
    je blue_print

    cmp ecx, 8  
    je pink_print  
    cmp ecx, 7
    je pink_print
    cmp ecx, 6
    je pink_print
    cmp ecx, 5
    je pink_print
    cmp ecx, 4
    je pink_print
    cmp ecx, 3
    je pink_print
    jmp print_simple

blue_print:
    mov eax, blue + (black * 16)
    call SetTextColor
    call WriteString
    call Crlf
    jmp continue_loop

pink_print:
    mov eax, lightred + (black * 16)
    call SetTextColor
    call WriteString
    call Crlf
    jmp continue_loop

print_simple:
    mov eax, white
    call SetTextColor
    call WriteString
    call Crlf
    jmp continue_loop

continue_loop:
    ; Move ESI to next string
nextString:
    mov al, [esi]
    cmp al, 0
    je foundNull
    inc esi
    jmp nextString

foundNull:
    inc esi          ; skip over the null terminator move to next array element 
    dec ecx
    jnz printLoop


    ;after done printing menu , wait for user response either instrcutions screen or game levels 
    call ReadChar ;store val in al
    cmp al, 'i'
    je instruction_screen_label
    cmp al, '1'
    je level_one_label
    cmp al, '2'
    je level_two_label
    cmp al, '3'
    je level_three_label
    cmp al, 's'
    je show_scores_label
    cmp al, 'x'
    je exit_game
    jmp ret_from_loop

instruction_screen_label:
    call display_instruction_screen
    jmp ret_from_loop

level_one_label:
    call clrscr
    call display_map_level_1
    jmp ret_from_loop

level_two_label:
    call clrscr
    call display_map_level_2
    jmp ret_from_loop

level_three_label:
    call clrscr
    call display_map_level_3
    jmp ret_from_loop

show_scores_label:
    call display_scores
    jmp ret_from_loop

exit_game:
    call Clrscr
    exit

ret_from_loop:
    ret
display_menu_screen ENDP

display_instruction_screen PROC

call Clrscr
 mov esi, OFFSET instruction_screen ;
mov ecx, 21   ; number of instruction screen lines

printinstructionLoop:
    mov edx, esi    
    cmp ecx, 17
    je blue_instruction
    cmp ecx, 16
    je blue_instruction
    cmp ecx, 15
    je blue_instruction
    cmp ecx, 14
    je blue_instruction
    cmp ecx, 13  
    je blue_instruction 

    cmp ecx, 10
    je yellow_instruction
    cmp ecx, 9
    je yellow_instruction
    cmp ecx, 8
    je yellow_instruction
    cmp ecx, 7  
    je yellow_instruction  
    cmp ecx, 6
    je yellow_instruction

    jmp simple_instruction


blue_instruction:
    mov eax, blue + (black * 16)
    call SetTextColor
    call WriteString
    call Crlf
    jmp continuee

yellow_instruction:
    mov eax, yellow + (black * 16)
    call SetTextColor
    call WriteString
    call Crlf
    jmp continuee

simple_instruction:
    mov eax, white
    call SetTextColor
    call WriteString
    call Crlf
    jmp continuee

continuee:
next_String:
    mov al, [esi]
    cmp al, 0
    je found_Null
    inc esi
    jmp next_String

found_Null:
    inc esi          ; skip over the null terminator

    dec ecx
    jnz printinstructionLoop

call WaitMsg  ;wait for user repons
call clrscr  ;clear out screen 
call display_menu_screen  ;go back to menu screen
ret

display_instruction_screen ENDP

;some global labels:

makerandomize: ;not used 
    call randomize
    mov eax, 4
    call RandomRange
    mov ghostdirection, al
    jmp ghostMovement

makeRandomDirection:
    call Randomize
    mov eax, 4           ; Range 0-3
    call RandomRange
    mov ghostdirection, al
    ret

DrawGhost proc
    mov eax, red + (black * 16)  ; Red ghost on black background
    call SetTextColor
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, 'G'                 ; Ghost character
    call WriteChar
    ret
DrawGhost endp

UpdateGhost proc
    mov eax, black + (black * 16)  ; Black on black (erase)
    call SetTextColor
    mov dl, ghostxPos
    mov dh, ghostyPos
    call Gotoxy
    mov al, ' '                   ; Space to erase
    call WriteChar
    ret
UpdateGhost endp

;DrawPowerFruit proc
 ;   mov eax, yellow + (black * 16)  ; Yellow power fruit
  ;  call SetTextColor
  ;  mov dl, power_fruit_x
  ;  mov dh, power_fruit_y
  ;  call Gotoxy
  ;  mov al, '*'                 ; Power fruit character
  ;  call WriteChar
  ;  ret
;DrawPowerFruit endp

;DrawCherry proc
 ;   mov eax, lightred + (black * 16)  ; Red cherry
 ;   call SetTextColor
 ;   mov dl, cherry_x
 ;   mov dh, cherry_y
 ;   call Gotoxy
 ;   mov al, '$'                 ; Cherry character
 ;   call WriteChar
 ;   ret
;DrawCherry endp

ghostMovement:
    mov eax, 80         ; Increased delay for more stable movement
    call Delay
    call UpdateGhost     ; Erase current position

    ; Randomly change direction occasionally
    mov eax, 15        
    call RandomRange
    cmp eax, 0
    je makeRandomDirection

    cmp ghostdirection, 0
    je moveGhostup
    cmp ghostdirection, 1
    je moveGhostdown
    cmp ghostdirection, 2
    je moveGhostright
    cmp ghostdirection, 3
    je moveGhostleft

moveGhostUp:
    cmp ghostypos, 2     ; Check top boundary
    je makeRandomDirection
    
    ; Check for wall collision
    mov al, current_level
    cmp al, 1
    je use_level1_map_up
    cmp al, 2
    je use_level2_map_up
    mov esi, OFFSET level3_map
    jmp continue_up_ghost
use_level2_map_up:
    mov esi, OFFSET level2_map
    jmp continue_up_ghost
use_level1_map_up:
    mov esi, OFFSET level1_map
continue_up_ghost:
    movzx ecx, ghostypos
    dec ecx              
    mov eax, 0
find_row_up_ghost:
    cmp ecx, 0
    je check_wall_up_ghost
    mov al, [esi]
    cmp al, 0
    je next_row_up_ghost
    inc esi
    jmp find_row_up_ghost
next_row_up_ghost:
    inc esi
    dec ecx
    jmp find_row_up_ghost
check_wall_up_ghost:
    movzx eax, ghostxpos
    add esi, eax
    mov bl, [esi]
    cmp bl, '0'          ; Check for wall
    je makeRandomDirection
    cmp bl, ' '          ; Check if space is empty
    jne makeRandomDirection
    
    dec ghostypos        ; Move up
    call DrawGhost
    ret

moveGhostDown:
    cmp ghostypos, 24    ; Check bottom boundary
    je makeRandomDirection
    
    ; Check for wall collision
    mov al, current_level
    cmp al, 1
    je use_level1_map_down
    cmp al, 2
    je use_level2_map_down
    mov esi, OFFSET level3_map
    jmp continue_down_ghost
use_level2_map_down:
    mov esi, OFFSET level2_map
    jmp continue_down_ghost
use_level1_map_down:
    mov esi, OFFSET level1_map
continue_down_ghost:
    movzx ecx, ghostypos
    inc ecx              ; Check position below
    mov eax, 0
find_row_down_ghost:
    cmp ecx, 0
    je check_wall_down_ghost
    mov al, [esi]
    cmp al, 0
    je next_row_down_ghost
    inc esi
    jmp find_row_down_ghost
next_row_down_ghost:
    inc esi
    dec ecx
    jmp find_row_down_ghost
check_wall_down_ghost:
    movzx eax, ghostxpos
    add esi, eax
    mov bl, [esi]
    cmp bl, '0'          ; Check for wall
    je makeRandomDirection
    cmp bl, ' '          ; Check if space is empty
    jne makeRandomDirection
    
    inc ghostypos        ; Move down
    call DrawGhost
    ret

moveGhostLeft:
    cmp ghostxpos, 1     ; Check left boundary
    je makeRandomDirection
    
    ; Check for wall collision
    mov al, current_level
    cmp al, 1
    je use_level1_map_left
    cmp al, 2
    je use_level2_map_left
    mov esi, OFFSET level3_map
    jmp continue_left_ghost
use_level2_map_left:
    mov esi, OFFSET level2_map
    jmp continue_left_ghost
use_level1_map_left:
    mov esi, OFFSET level1_map
continue_left_ghost:
    movzx ecx, ghostypos
    mov eax, 0
find_row_left_ghost:
    cmp ecx, 0
    je check_wall_left_ghost
    mov al, [esi]
    cmp al, 0
    je next_row_left_ghost
    inc esi
    jmp find_row_left_ghost
next_row_left_ghost:
    inc esi
    dec ecx
    jmp find_row_left_ghost
check_wall_left_ghost:
    movzx eax, ghostxpos
    dec eax              ; Check position to the left
    add esi, eax
    mov bl, [esi]
    cmp bl, '0'          ; Check for wall
    je makeRandomDirection
    cmp bl, ' '          ; Check if space is empty
    jne makeRandomDirection
    
    dec ghostxpos        ; Move left
    call DrawGhost
    ret

moveGhostRight:
    cmp ghostxpos, 79    ; Check right boundary
    je makeRandomDirection
    
    ; Check for wall collision
    mov al, current_level
    cmp al, 1
    je use_level1_map_right
    cmp al, 2
    je use_level2_map_right
    mov esi, OFFSET level3_map
    jmp continue_right_ghost
use_level2_map_right:
    mov esi, OFFSET level2_map
    jmp continue_right_ghost
use_level1_map_right:
    mov esi, OFFSET level1_map
continue_right_ghost:
    movzx ecx, ghostypos
    mov eax, 0
find_row_right_ghost:
    cmp ecx, 0
    je check_wall_right_ghost
    mov al, [esi]
    cmp al, 0
    je next_row_right_ghost
    inc esi
    jmp find_row_right_ghost
next_row_right_ghost:
    inc esi
    dec ecx
    jmp find_row_right_ghost
check_wall_right_ghost:
    movzx eax, ghostxpos
    inc eax              ; Check position to the right
    add esi, eax
    mov bl, [esi]
    cmp bl, '0'          ; Check for wall
    je makeRandomDirection
    cmp bl, ' '          ; Check if space is empty
    jne makeRandomDirection
    
    inc ghostxpos        ; Move right
    call DrawGhost
    ret

level_1_game PROC
    mov current_level, 1    ; Set level number
    ; Initialize positions
    mov ghostxpos, 3    
    mov ghostypos, 8
    mov pacman_x, 7
    mov pacman_y, 4
    mov score, 0
    mov lives, 3

    ; Draw initial positions
    call DrawGhost

game_loop:
    ; Display score and lives
    mov dl, 60
    mov dh, 9
    call Gotoxy
    mov eax, white + (black * 16)
    call SetTextColor
    mov ax, score
    call WriteInt

    mov dl, 53
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET lives_msg
    call WriteString
    movzx eax, lives
    call WriteInt

    ; Check for collision with ghost - more precise collision detection
    mov al, pacman_x
    cmp al, ghostxpos
    jne no_collision
    mov al, pacman_y
    cmp al, ghostypos
    jne no_collision ;if position are not equal, jump to no_collison
    
    ;if no collison jumps did not occur, then we have a collision
    dec lives
    mov eax, 150        ; Add delay after collision
    call Delay
    cmp lives, 0
    je game_over
    jmp reset_positions

reset_positions:
    ; Erase ghost from current position
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, ' '
    call WriteChar

    mov pacman_x, 7 ; reset to initial pacman postion 
    mov pacman_y, 4
    mov ghostxpos, 40 ;reset to initial ghost position
    mov ghostypos, 8
    call DrawGhost
    mov eax, 200        ; Add delay after reset
    call Delay
    jmp continue_game

no_collision:
    ; Draw pacman
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov eax, blue + (black * 16)
    call SetTextColor
    mov al, pacman
    call WriteChar

    call UpdateGhost
    call ghostMovement
    call DrawGhost

continue_game:
    mov eax, 150        
    call Delay

    ;take a user input 
    call ReadKey         ;input is in al
    jz game_loop        ; If no key pressed, continue loop
    mov bl, al          ;save in bl

    ; Check for 'b' to return to menu
    cmp bl, 'b'
    je return_to_menu

    cmp bl, 'x'
    je game_over

    ; Erase pacman from current position
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Move based on key
    cmp bl, 'w'
    je move_up
    cmp bl, 'a'
    je move_left
    cmp bl, 's'
    je move_down
    cmp bl, 'd'
    je move_right

    jmp game_loop

game_over:
    ; Play game over sound
    INVOKE PlaySound, OFFSET gameoverSound, NULL, 0
    call save_score
    call Clrscr
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET game_over_msg
    call WriteString
    call ReadChar
    call Clrscr
    call display_menu_screen
    ret

return_to_menu:
    call Clrscr
    call display_menu_screen
    ret

move_up:
    cmp pacman_y, 1      ; Check top boundary
    je game_loop
    movzx esi, pacman_y
    dec esi
    mov edi, OFFSET level1_map
    mov ecx, esi
find_row_up:
    cmp ecx, 0
    je row_found_up
find_next_row_up:
    mov al, [edi]
    cmp al, 0
    je null_found_up
    inc edi
    jmp find_next_row_up
null_found_up:
    inc edi
    dec ecx
    jmp find_row_up
row_found_up:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '.'
    jne check_empty_up
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play zap sound only when eating dots
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up
check_empty_up:
    cmp al, ' '          ; Allow movement into empty space
    je move_only_up
    jmp game_loop

move_only_up:
    dec pacman_y
    jmp game_loop

move_down:
    cmp pacman_y, 24     ; Check bottom boundary
    je game_loop

    movzx esi, pacman_y
    inc esi
    mov edi, OFFSET level1_map
    mov ecx, esi
find_row_down:
    cmp ecx, 0
    je row_found_down
find_next_row_down:
    mov al, [edi]
    cmp al, 0
    je null_found_down
    inc edi
    jmp find_next_row_down
null_found_down:
    inc edi
    dec ecx
    jmp find_row_down
row_found_down:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '.'
    jne check_empty_down
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down
check_empty_down:
    cmp al, ' '          ; Allow movement into empty space
    je move_only_down
    jmp game_loop

move_only_down:
    inc pacman_y
    jmp game_loop

move_left:
    cmp pacman_x, 1      ; Check left boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level1_map
    mov ecx, esi
find_row_left:
    cmp ecx, 0
    je row_found_left
find_next_row_left:
    mov al, [edi]
    cmp al, 0
    je null_found_left
    inc edi
    jmp find_next_row_left
null_found_left:
    inc edi
    dec ecx
    jmp find_row_left
row_found_left:
    movzx eax, pacman_x
    dec eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '.'
    jne check_empty_left
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left
check_empty_left:
    cmp al, ' '          ; Allow movement into empty space
    je move_only_left
    jmp game_loop

move_only_left:
    dec pacman_x
    jmp game_loop

move_right:
    cmp pacman_x, 79     ; Check right boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level1_map
    mov ecx, esi
find_row_right:
    cmp ecx, 0
    je row_found_right
find_next_row_right:
    mov al, [edi]
    cmp al, 0
    je null_found_right
    inc edi
    jmp find_next_row_right
null_found_right:
    inc edi
    dec ecx
    jmp find_row_right
row_found_right:
    movzx eax, pacman_x
    inc eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '.'
    jne check_empty_right
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right
check_empty_right:
    cmp al, ' '          ; Allow movement into empty space
    je move_only_right
    jmp game_loop

move_only_right:
    inc pacman_x
    jmp game_loop

ret
level_1_game ENDP 


display_map_level_1 PROC
    mov esi, OFFSET level1_map  
    mov ecx, 22               

next_line:
    push ecx                    ;outer loop counter

    mov edi, esi                ; EDI pointer to current char in row

print_char:
    mov al, [edi]
    cmp al, 0
    je end_line                 ; end of the current line, jab tak yahan nahi ay ge, loop will continue

    mov bl, al                  ; Save character for printing

    ;different colors for different componenets 
    cmp al, '.'
    je set_yellow
    cmp al, '0'
    je set_magenta
 
    mov eax, white + (black * 16)
    call SetTextColor
    jmp print_and_continue

set_yellow:
    mov eax, yellow + (black * 16)
    call SetTextColor
    jmp print_and_continue

set_magenta:
    mov eax, magenta + (black * 16)
    call SetTextColor

print_and_continue:
    mov al, bl          ;character saved was in bl, mov to al for writechar
call WriteChar

    inc edi      ;mov to next character 
    jmp print_char  

end_line:
    call Crlf
    pop ecx                     ; Restore loop counter

find_next_row:   
    mov al, [esi]
    cmp al, 0    ;if end is reached
    je row_found   ;it meanns we found next row start 
    inc esi              ;esi moves to next row ,
    jmp find_next_row

row_found:
    inc esi                ; skip null termiantor 
    dec ecx            ;decrement loop counter
   jnz next_line
    
   mov dl, 0   ;bring cursor to end position 
   mov dh, 23
   call gotoxy

  call level_1_game

    ret
display_map_level_1 ENDP

display_map_level_2 PROC
    mov esi, OFFSET level2_map  ; ESI = pointer to current row
    mov ecx, 22                 ; Number of rows

next_line2:
    push ecx                    ; Save outer loop counter

    mov edi, esi                ; EDI = pointer to current char in row

print_char2:
    mov al, [edi]
    cmp al, 0
    je end_line2                 ; End of this row (null terminator)

    mov bl, al                  ;bl has character to be printed

    ; Color logic
    cmp al, '.'
    je set_yellow2
    cmp al, '0'
    je set_magenta2
    cmp al, '*'
    je set_yellow2

    ; Default color
    mov eax, white + (black * 16)
    call SetTextColor
    jmp print_and_continue2

set_yellow2:
    mov eax, yellow + (black * 16)
    call SetTextColor
    jmp print_and_continue2

set_magenta2:
    mov eax, magenta + (black * 16)
    call SetTextColor
    jmp print_and_continue2

print_and_continue2:
    mov al, bl
    call WriteChar

    inc edi
    jmp print_char2

end_line2:
    call Crlf
    pop ecx                     ; Restore loop counter
   
find_next_row2:                 ;move to next string
    mov al, [esi]
    cmp al, 0
    je row_found2
    inc esi
    jmp find_next_row2

row_found2:
    inc esi                     ; Move past null terminator
    dec ecx
    jnz next_line2
    
    mov dl, 0
    mov dh, 23
    call gotoxy

    call level_2_game
    ret
display_map_level_2 ENDP

level_2_game PROC
    mov current_level, 2    ; Set level number
    ; Initialize positions
    mov ghostxpos, 10    
    mov ghostypos, 8
    mov pacman_x, 7
    mov pacman_y, 4
    mov score, 0
    mov lives, 3
    mov power_active, 0
    mov power_timer, 0

    ; Draw initial positions
    call DrawGhost

game_loop:
    ; Display score and lives
    mov dl, 60
    mov dh, 9
    call Gotoxy
    mov eax, white + (black * 16)
    call SetTextColor
    mov ax, score
    call WriteInt

    mov dl, 53
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET lives_msg
    call WriteString
    movzx eax, lives
    call WriteInt

    ; Display power status
    mov dl, 53
    mov dh, 11
    call Gotoxy
    mov edx, OFFSET power_active_msg
    call WriteString
    cmp power_active, 1
    je show_power_active
    mov edx, OFFSET power_inactive_char
    jmp display_power_status
show_power_active:
    mov edx, OFFSET power_active_char
    mov eax, yellow + (black * 16)
    call SetTextColor
display_power_status:
    call WriteString
    mov eax, white + (black * 16)
    call SetTextColor

    ; Check for collision with ghost
    mov al, pacman_x
    cmp al, ghostxpos
    jne no_collision
    mov al, pacman_y
    cmp al, ghostypos
    jne no_collision
    
    ; Collision with ghost
    cmp power_active, 1
    je ghost_eaten
    dec lives
    cmp lives, 0
    je game_over
    jmp reset_positions

ghost_eaten:
    ; Erase ghost from current position
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Add score for eating ghost
    mov ax, score
    add ax, 200
    mov score, ax

    ; Save score before showing win message
    call save_score

    ; Clear screen and show win message
    call Clrscr
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET win_msg
    call WriteString
    call ReadChar
    call Clrscr
    call display_menu_screen
    ret

reset_positions:
    ; Erase ghost from current position
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Reset positions
    mov pacman_x, 7
    mov pacman_y, 4
    mov ghostxpos, 40
    mov ghostypos, 8
    call DrawGhost    ; ghost is drawn at new position
    jmp continue_game

no_collision:
    ; Draw pacman
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov eax, blue + (black * 16)
    call SetTextColor
    mov al, pacman
    call WriteChar

    call UpdateGhost
    call ghostMovement
    call DrawGhost

continue_game:
    ; Decrement power timer if active
    cmp power_active, 1
    jne skip_power_timer
    dec power_timer
    jnz skip_power_timer
    mov power_active, 0    
skip_power_timer:

    mov eax, 150        ; Increased main game loop delay for stability
    call Delay

    ; Check for keypress without waiting
    call ReadKey
    jz game_loop        ; If no key pressed, continue loop
    mov bl, al

    ; Check for 'b' to return to menu
    cmp bl, 'b'
    je return_to_menu

    cmp bl, 'x'
je game_over

    ; Erase pacman from current position
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Move based on key
    cmp bl, 'w'
    je move_up
    cmp bl, 'a'
    je move_left
    cmp bl, 's'
    je move_down
    cmp bl, 'd'
    je move_right

    jmp game_loop

game_over:
    ; Play game over sound
    INVOKE PlaySound, OFFSET gameoverSound, NULL, 0
    call save_score    ; Save score before game over
    call Clrscr
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET game_over_msg
    call WriteString
    call ReadChar
    call Clrscr
    call display_menu_screen
    ret

return_to_menu:
    call Clrscr
    call display_menu_screen
    ret

move_up:
    cmp pacman_y, 1      ; Check top boundary
    je game_loop

    movzx esi, pacman_y
    dec esi
    mov edi, OFFSET level2_map
    mov ecx, esi
find_row_up:
    cmp ecx, 0
    je row_found_up
find_next_row_up:
    mov al, [edi]
    cmp al, 0
    je null_found_up
    inc edi
    jmp find_next_row_up
null_found_up:
    inc edi
    dec ecx
    jmp find_row_up
row_found_up:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '*'
    je power_fruit_collected
    cmp al, '.'
    jne check_empty_up
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up
check_empty_up:
    cmp al, ' '          ; Allow movement into empty space
    je move_only_up
    jmp game_loop

power_fruit_collected:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up

move_only_up:
    dec pacman_y
    jmp game_loop

move_down:
    cmp pacman_y, 24     ; Check bottom boundary
    je game_loop

    movzx esi, pacman_y
    inc esi
    mov edi, OFFSET level2_map
    mov ecx, esi
find_row_down:
    cmp ecx, 0
    je row_found_down
find_next_row_down:
    mov al, [edi]
    cmp al, 0
    je null_found_down
    inc edi
    jmp find_next_row_down
null_found_down:
    inc edi
    dec ecx
    jmp find_row_down
row_found_down:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '*'
    je power_fruit_collected_down
    cmp al, '.'
    jne move_only_down
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play zap sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down

power_fruit_collected_down:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down

move_only_down:
    inc pacman_y
    jmp game_loop

move_left:
    cmp pacman_x, 1      ; Check left boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level2_map
    mov ecx, esi
find_row_left:
    cmp ecx, 0
    je row_found_left
find_next_row_left:
    mov al, [edi]
    cmp al, 0
    je null_found_left
    inc edi
    jmp find_next_row_left
null_found_left:
    inc edi
    dec ecx
    jmp find_row_left
row_found_left:
    movzx eax, pacman_x
    dec eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '*'
    je power_fruit_collected_left
    cmp al, '.'
    jne move_only_left
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left

power_fruit_collected_left:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left

move_only_left:
    dec pacman_x
    jmp game_loop

move_right:
    cmp pacman_x, 79     ; Check right boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level2_map
    mov ecx, esi
find_row_right:
    cmp ecx, 0
    je row_found_right
find_next_row_right:
    mov al, [edi]
    cmp al, 0
    je null_found_right
    inc edi
    jmp find_next_row_right
null_found_right:
    inc edi
    dec ecx
    jmp find_row_right
row_found_right:
    movzx eax, pacman_x
    inc eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '*'
    je power_fruit_collected_right
    cmp al, '.'
    jne move_only_right
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right

power_fruit_collected_right:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right

move_only_right:
    inc pacman_x
    jmp game_loop

ret
level_2_game ENDP

display_map_level_3 PROC
    mov esi, OFFSET level3_map  ; ESI = pointer to current row
    mov ecx, 22                 ; Number of rows

next_line3:
    push ecx                    ; Save outer loop counter

    mov edi, esi                ; EDI is liek a pointer to current char in row

print_char3:
    mov al, [edi]
    cmp al, 0
    je end_line3                 ; End of this row (null terminator)

    mov bl, al                 

    ; Color logic
    cmp al, '.'
    je set_yellow3
    cmp al, '0'
    je set_magenta3
    cmp al, '$'
    je set_red3

    ; Default color
    mov eax, white + (black * 16)
    call SetTextColor
    jmp print_and_continue3

set_yellow3:
    mov eax, yellow + (black * 16)
    call SetTextColor
    jmp print_and_continue3

set_magenta3:
    mov eax, magenta + (black * 16)
    call SetTextColor
    jmp print_and_continue3

set_red3:
    mov eax, lightred + (black * 16)
    call SetTextColor
    jmp print_and_continue3

print_and_continue3:
    mov al, bl
    call WriteChar

    inc edi
    jmp print_char3

end_line3:
    call Crlf
    pop ecx                     ; Restore loop counter
    ; Move ESI to next string
find_next_row3:
    mov al, [esi]
    cmp al, 0
    je row_found3
    inc esi
    jmp find_next_row3

row_found3:
    inc esi                     ; Move past null terminator
    dec ecx
    jnz next_line3
    
    mov dl, 0
    mov dh, 23
    call gotoxy

    call level_3_game
    ret
display_map_level_3 ENDP

level_3_game PROC
    mov current_level, 3    ; Set level number
    ; Initialize positions
    mov ghostxpos, 40    
    mov ghostypos, 8
    mov pacman_x, 7
    mov pacman_y, 4
    mov score, 0
    mov lives, 3
    mov power_active, 0
    mov power_timer, 0
  ;  mov cherry_x, 40
  ;  mov cherry_y, 12

    ; Draw initial positions
    call DrawGhost

game_loop:
    ; Display score and lives
    mov dl, 60
    mov dh, 9
    call Gotoxy
    mov eax, white + (black * 16)
    call SetTextColor
    mov ax, score
    call WriteInt

    mov dl, 53
    mov dh, 10
    call Gotoxy
    mov edx, OFFSET lives_msg
    call WriteString
    movzx eax, lives
    call WriteInt

    ; Display power status
    mov dl, 53
    mov dh, 11
    call Gotoxy
    mov edx, OFFSET power_active_msg
    call WriteString
    cmp power_active, 1
    je show_power_active
    mov edx, OFFSET power_inactive_char
    jmp display_power_status
show_power_active:
    mov edx, OFFSET power_active_char
    mov eax, yellow + (black * 16)
    call SetTextColor
display_power_status:
    call WriteString
    mov eax, white + (black * 16)
    call SetTextColor

    ; Move ghost first to ensure position is updated
    call UpdateGhost
    call ghostMovement
    call DrawGhost

    ; Check for collision with ghost after movement
    mov al, pacman_x
    cmp al, ghostxpos
    jne no_collision
    mov al, pacman_y
    cmp al, ghostypos
    jne no_collision
    
    ; Collision with ghost
    cmp power_active, 1
    je ghost_eaten
    dec lives
    cmp lives, 0
    je game_over
    jmp reset_positions

ghost_eaten:
    ; Erase ghost from current position
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Add score for eating ghost
    mov ax, score
    add ax, 200
    mov score, ax

    ; Save score before showing win message
    call save_score

    ; Clear screen and show win message
    call Clrscr
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET win_msg
    call WriteString
    call ReadChar
    call Clrscr
    call display_menu_screen
    ret

reset_positions:
    ; Erase ghost from current position
    mov dl, ghostxpos
    mov dh, ghostypos
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Reset positions
    mov pacman_x, 7
    mov pacman_y, 4
    mov ghostxpos, 40
    mov ghostypos, 8
    call DrawGhost    ; Make sure ghost is drawn at new position
    jmp continue_game

no_collision:
    ; Draw pacman
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov eax, blue + (black * 16)
    call SetTextColor
    mov al, pacman
    call WriteChar

    ; Move ghost once per game loop for more stable movement
    call UpdateGhost
    call ghostMovement
    call DrawGhost

continue_game:
    ; Decrement power timer if active
    cmp power_active, 1
    jne skip_power_timer
    dec power_timer
    jnz skip_power_timer
    mov power_active, 0    ; Turn off power when timer reaches 0
skip_power_timer:

    mov eax, 150        ; Increased main game loop delay for stability
    call Delay

    ; Check for keypress without waiting
    call ReadKey
    jz game_loop        ; If no key pressed, continue loop
    mov bl, al

    ; Check for 'b' to return to menu
    cmp bl, 'b'
    je return_to_menu

    cmp bl, 'x'
je game_over


    ; Erase pacman from current position
    mov dl, pacman_x
    mov dh, pacman_y
    call Gotoxy
    mov al, ' '
    call WriteChar

    ; Move based on key
    cmp bl, 'w'
    je move_up
    cmp bl, 'a'
    je move_left
    cmp bl, 's'
    je move_down
    cmp bl, 'd'
    je move_right

    jmp game_loop

game_over:
    ; Play game over sound
    INVOKE PlaySound, OFFSET gameoverSound, NULL, 0
    
    ; Save score before game over
    pushad  ; Save all registers
    call save_score
    popad   ; Restore all registers
    
    call Clrscr
    mov dl, 35
    mov dh, 12
    call Gotoxy
    mov edx, OFFSET game_over_msg
    call WriteString
    call ReadChar
    call Clrscr
    call display_menu_screen
    ret

return_to_menu:
    call Clrscr
    call display_menu_screen
    ret

move_up:
    cmp pacman_y, 2      ; Check top boundary
    je game_loop

    movzx esi, pacman_y
    dec esi
    mov edi, OFFSET level3_map
    mov ecx, esi
find_row_up:
    cmp ecx, 0
    je row_found_up
find_next_row_up:
    mov al, [edi]
    cmp al, 0
    je null_found_up
    inc edi
    jmp find_next_row_up
null_found_up:
    inc edi
    dec ecx
    jmp find_row_up
row_found_up:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '$'
    je cherry_collected_up
    cmp al, '*'
    je power_fruit_collected_up
    cmp al, '.'
    jne move_only_up
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up

cherry_collected_up:
    inc lives            ; Increase lives by 1
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up

power_fruit_collected_up:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_up

move_only_up:
    dec pacman_y
    jmp game_loop

move_down:
    cmp pacman_y, 24     ; Check bottom boundary
    je game_loop

    movzx esi, pacman_y
    inc esi
    mov edi, OFFSET level3_map
    mov ecx, esi
find_row_down:
    cmp ecx, 0
    je row_found_down
find_next_row_down:
    mov al, [edi]
    cmp al, 0
    je null_found_down
    inc edi
    jmp find_next_row_down
null_found_down:
    inc edi
    dec ecx
    jmp find_row_down
row_found_down:
    movzx eax, pacman_x
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '$'
    je cherry_collected_down
    cmp al, '*'
    je power_fruit_collected_down
    cmp al, '.'
    jne move_only_down
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down

cherry_collected_down:
    inc lives            ; Increase lives by 1
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down

power_fruit_collected_down:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_down

move_only_down:
    inc pacman_y
    jmp game_loop

move_left:
    cmp pacman_x, 1      ; Check left boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level3_map
    mov ecx, esi
find_row_left:
    cmp ecx, 0
    je row_found_left
find_next_row_left:
    mov al, [edi]
    cmp al, 0
    je null_found_left
    inc edi
    jmp find_next_row_left
null_found_left:
    inc edi
    dec ecx
    jmp find_row_left
row_found_left:
    movzx eax, pacman_x
    dec eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '$'
    je cherry_collected_left
    cmp al, '*'
    je power_fruit_collected_left
    cmp al, '.'
    jne move_only_left
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left

cherry_collected_left:
    inc lives            ; Increase lives by 1
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left

power_fruit_collected_left:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_left

move_only_left:
    dec pacman_x
    jmp game_loop

move_right:
    cmp pacman_x, 79     ; Check right boundary
    je game_loop

    movzx esi, pacman_y
    mov edi, OFFSET level3_map
    mov ecx, esi
find_row_right:
    cmp ecx, 0
    je row_found_right
find_next_row_right:
    mov al, [edi]
    cmp al, 0
    je null_found_right
    inc edi
    jmp find_next_row_right
null_found_right:
    inc edi
    dec ecx
    jmp find_row_right
row_found_right:
    movzx eax, pacman_x
    inc eax
    add edi, eax
    mov al, [edi]
    cmp al, '0'          ; Check for wall
    je game_loop
    cmp al, '$'
    je cherry_collected_right
    cmp al, '*'
    je power_fruit_collected_right
    cmp al, '.'
    jne move_only_right
    mov ax, score 
    inc ax 
    mov score, ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right

cherry_collected_right:
    inc lives            ; Increase lives by 1
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right

power_fruit_collected_right:
    mov power_active, 1
    mov power_timer, 50
    push ax
    mov ax, score
    shl ax, 1    ; Multiply score by 2 (shift left by 1)
    mov score, ax
    pop ax
    mov byte ptr [edi], ' '
    ; Play waka sound
    INVOKE PlaySound, OFFSET DotSound, NULL, 0
    jmp move_only_right

move_only_right:
    inc pacman_x
    jmp game_loop

ret
level_3_game ENDP

save_score PROC
    ; First try to open existing file
    mov edx, OFFSET score_file
    call OpenInputFile
    mov score_handle, eax
    
    ; If file doesn't exist (error), create new file
    cmp eax, INVALID_HANDLE_VALUE
    jne file_exists
    
    mov edx, OFFSET score_file
    call CreateOutputFile
    mov score_handle, eax
    cmp eax, INVALID_HANDLE_VALUE
    je file_error
    jmp write_score
    
file_exists:
    ; Close the file we just opened
    mov eax, score_handle
    call CloseFile
    
    ; Open file for appending
    mov edx, OFFSET score_file
    call CreateOutputFile
    mov score_handle, eax
    cmp eax, INVALID_HANDLE_VALUE
    je file_error
    
write_score:
    ; Write "Username: "
    mov eax, score_handle
    mov edx, OFFSET username_label
    mov ecx, 9  ; length of "Username: "
    call WriteToFile
    jc write_error

    ; Write the username
    mov eax, score_handle
    mov edx, OFFSET userName
    call StrLength  ; Get length of username
    mov ecx, eax    ; Use actual length
    call WriteToFile
    jc write_error

    ; Write a space
    mov eax, score_handle
    mov edx, OFFSET space_str
    mov ecx, 1
    call WriteToFile
    jc write_error

    ; Write level number
    mov eax, score_handle
    mov edx, OFFSET score_buffer
    mov ecx, 6  ; length of "Level "
    call WriteToFile
    jc write_error
    
    ; Write current level number
    movzx eax, current_level
    call WriteInt
    
    ; Write score label
    mov eax, score_handle
    mov edx, OFFSET score_buffer2
    mov ecx, 10  ; length of " - Score: "
    call WriteToFile
    jc write_error
    
    ; Write actual score
    mov ax, score
    call WriteInt
    
    ; Write newline
    mov eax, score_handle
    mov edx, OFFSET CrLf
    mov ecx, 2
    call WriteToFile
    jc write_error
    
    ; Close file
    mov eax, score_handle
    call CloseFile
    ret

file_error:
    ret

write_error:
    ret

read_error:
    ret

save_score ENDP

display_scores PROC
    call Clrscr
    
    ; Display header
    mov edx, OFFSET view_scores_msg
    call WriteString
    call Crlf
    call Crlf

    ; Try to open the scores file
    mov edx, OFFSET score_file
    call OpenInputFile
    mov score_handle, eax
    
    ; Check if file exists
    cmp eax, INVALID_HANDLE_VALUE
    je no_scores
    
    ; Read and display file contents
    mov edx, OFFSET file_buffer
    mov ecx, 200
    call ReadFromFile
    
    ; Display what was read
    mov edx, OFFSET file_buffer
    call WriteString
    call Crlf
    
    ; Close file
    mov eax, score_handle
    call CloseFile
    call WaitMsg
    
no_scores:
    mov edx, OFFSET no_scores_msg
    call WriteString
    call Crlf
    

    ret
display_scores ENDP

main PROC
INVOKE PlaySound, OFFSET themeSound, NULL, 1h
    call display_welcome_screen 
    call Crlf
    call get_name_input 
    call Clrscr
    call display_menu_screen
main ENDP
END main
