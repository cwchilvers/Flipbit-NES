;-------------------------------------------------------------------------------
; NES Header
;-------------------------------------------------------------------------------
    .inesprg    1   ; Number of 16KB PRG-ROM banks
    .ineschr    1   ; Number of 8KB CHR-ROM / VROM banks
    .inesmap    0   ; Mapper number (0 for NROM)

;-------------------------------------------------------------------------------
; Import External Modules
;-------------------------------------------------------------------------------
    .include "constants.asm"
    .include "game_logic.asm"
    .include "player/player_animation.asm"
    .include "player/player_movement.asm"

;-------------------------------------------------------------------------------
; Reset Interrupt Handler
;-------------------------------------------------------------------------------
    .bank 0
    .org $8000

reset:
    ; Initialization code goes here, if needed

    ; Jump to the game loop
    jmp game_loop

;-------------------------------------------------------------------------------
; Game Loop
;-------------------------------------------------------------------------------
game_loop:
    ; Game logic goes here

    ; Call the player movement routine
    jsr player_movement

    ; Call the player animation routine
    jsr player_animation

    ; Call the game logic routine
    jsr game_logic

    ; Jump back to the game loop
    jmp game_loop

;-------------------------------------------------------------------------------
; Interrupt and NMI Vectors
;-------------------------------------------------------------------------------
    .bank 0
    .org $FFFA

    ; NMI (Vertical Blank)
    .dw nmi_handler

    ; Reset Interrupt
    .dw reset

    ; IRQ and BRK (not used in most simple NES projects)
    .dw irq_handler

;-------------------------------------------------------------------------------
; Subroutines (optional)
;-------------------------------------------------------------------------------
    ; Place any reusable subroutines here, such as utility functions or macros.

;-------------------------------------------------------------------------------
; CHR-ROM Data
;-------------------------------------------------------------------------------
    ; Add your CHR-ROM data for tiles and sprites here if you have any.

