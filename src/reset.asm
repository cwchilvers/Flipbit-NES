;-------------------------------------------------------------------------------
; Reset Interrupt Handler
;-------------------------------------------------------------------------------
    .bank 0
    .org $8000

reset:
    ; Initialize the stack pointer (SP) to a specific memory address
    lda #$FF
    tcs

    ; Disable the NMI (Vertical Blank) interrupt during initialization
    sei

    ; TODO: Additional initialization code goes here

    ; Enable the NMI (Vertical Blank) interrupt again
    cli

    ; Jump to the game loop
    jmp game_loop
