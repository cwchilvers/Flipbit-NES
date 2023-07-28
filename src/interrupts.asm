;-------------------------------------------------------------------------------
; NMI (Vertical Blank) Interrupt Handler
;-------------------------------------------------------------------------------
    .bank 0
    .org $FFFA

NMI_handler:
    ; Save CPU registers on the stack if needed (usually not necessary for VBLANK)
    ; (You can omit this step in most cases)

    ; Perform the necessary tasks during the Vertical Blank period
    ; (e.g., updating the screen, handling sound, etc.)

    ; Clear the vertical blank flag in the PPU status register to acknowledge the NMI
    lda #0
    sta PPU_status

    ; Return from the NMI interrupt
    rti

;-------------------------------------------------------------------------------
; Reset Interrupt Handler
;-------------------------------------------------------------------------------
    .bank 0
    .org $8000

reset_handler:
    ; Initialize the stack pointer (SP) to a specific memory address
    ldx #$FF
    txs

    ; Disable the NMI (Vertical Blank) interrupt during initialization
    sei

    ; TODO: Additional initialization code goes here
    ; For example, you might set up variables, clear memory, load data, etc.

    ; Enable the NMI (Vertical Blank) interrupt again
    cli

    ; Jump to the main game loop
    jmp game_loop

;-------------------------------------------------------------------------------
; IRQ (Interrupt Request) Handler (optional)
;-------------------------------------------------------------------------------
    .bank 0
    .org $FFFE

IRQ_handler:
    ; Save CPU registers on the stack if needed

    ; Perform the necessary tasks for the IRQ

    ; Return from the IRQ interrupt
    rti