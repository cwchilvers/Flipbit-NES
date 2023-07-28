;-------------------------------------------------------------------------------
; Import External Modules
;-------------------------------------------------------------------------------
    .include "../src/player/anim/player_anim_idle.asm"
    .include "../src/player/anim/player_anim_walk.asm"

;-------------------------------------------------------------------------------
; Player Animation Handler Data
;-------------------------------------------------------------------------------
; Constants
__idle EQU 0
__walking EQU 1

;-------------------------------------------------------------------------------
; Player Animation Handler Routines
;-------------------------------------------------------------------------------
player_anim_hdlr:
    ; TODO: Get the player's current state (e.g., walking, jumping, etc.)

    ; Based on the player's state, decide which animation script to call
    lda player_state
    cmp #__idle
    beq .CallWalkingAnimation
    cmp #__walking
    beq .CallJumpingAnimation

    ; If no specific state matched, return or do nothing
    rts

.CallWalkingAnimation:
    ; Call the player walking animation script (e.g., player_anim_walk.asm)
    ;jsr PlayerWalkingAnimation
    rts

.CallJumpingAnimation:
    ; Call the player jumping animation script (e.g., player_anim_jump.asm)
    ;jsr PlayerJumpingAnimation
    rts