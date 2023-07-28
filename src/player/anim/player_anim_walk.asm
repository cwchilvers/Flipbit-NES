;-------------------------------------------------------------------------------
; Player Walk Animation Data
;-------------------------------------------------------------------------------
; Data sequences for each frame's tiles
__frame_00_tiles: db $01, $02, $03, $02     ; ID for Frame 0
__frame_01_tiles: db $04, $05, $06, $05     ; ID for Frame 1
__frame_02_tiles: db $07, $08, $09, $08     ; ID for Frame 2

; Array of pointers to each frame's tiles
__frames:
    dw __frame_00_tiles     ; Frame 0 tiles
    dw __frame_01_tiles     ; Frame 1 tiles
    dw __frame_02_tiles     ; Frame 2 tiles

; Constants
__maxFrames: .equ player_anim_frame_max
__maxDelay: .equ player_anim_delay_max

; Variables
__frameIndex .equ player_anim_delay_index
__delayIndex: .equ player_anim_frame_index

;-------------------------------------------------------------------------------
; Player Walk Animation Routine
;-------------------------------------------------------------------------------
player_anim_walk:
    ; Increment the frame delay index
    inc __delayIndex

    ; Check if it's time to switch to the next frame
    cmp __delayIndex, #__maxDelay
    bcc .NoFrameSwitch

    ; Reset the frame delay index
    lda #0
    sta __delayIndex

    ; Increment the current frame index and wrap around if needed
    inc __frameIndex    ; Increment the frame index
    cmp #__maxFrames    ; Check if the frame index is out of bounds
    bne .NoWrapAround   ; If not, skip the next instruction
    lda #0              ; Otherwise, reset the frame index to 0
    sta __frameIndex

.NoWrapAround:
    ; Get the address of the current animation frame's tiles
    lda __frameIndex            ; Load the current frame index
    asl a                       
    tay                         ; Store the current frame index in Y
    lda __frames, y             ; Load the current frame's address (low byte)
    sta (frame's address)       ; TODO: Store the current frame's address

    ; TODO: Update the sprite's tiles on the screen with the tiles from the current frame

.NoFrameSwitch:
    rts