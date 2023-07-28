;-------------------------------------------------------------------------------
; NES Header
;-------------------------------------------------------------------------------
    .inesprg    1   ; Number of 16KB PRG-ROM banks
    .ineschr    1   ; Number of 8KB CHR-ROM / VROM banks
    .inesmap    0   ; Mapper number (0 for NROM)

;-------------------------------------------------------------------------------
; Import External Modules
;-------------------------------------------------------------------------------
    .include "../src/memory.asm"
    .include "../src/interrupts.asm"
    .include "../src/player/handlers/player_movement_hdlr.asm"
    .include "../src/player/handlers/player_anim_hdlr.asm"

;-------------------------------------------------------------------------------
; Game Loop
;-------------------------------------------------------------------------------
game_loop:
    ; Call the player movement routine
    ;jsr player_movement_hdlr

    ; Call the player animation routine
    ;jsr player_anim_hdlr

    ; Jump back to the game loop
    jmp game_loop

;-------------------------------------------------------------------------------
; Subroutines (optional)
;-------------------------------------------------------------------------------
    ; Place any reusable subroutines here, such as utility functions or macros.

;-------------------------------------------------------------------------------
; CHR-ROM Data
;-------------------------------------------------------------------------------
    ; Add your CHR-ROM data for tiles and sprites here if you have any.

