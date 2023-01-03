    processor 6502

    seg code
    org $F000       ; Define de code origin at $F000

Start:
    sei             ; Disable interrupts
    cld             ; DIsable the BCD decimal math mode
    ldx #$FF        ; Loads the X register with #$FF
    txs             ; Transfer the X register to the stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the page zero region($00 to $FF)
; Meaning the entire RAM and also the entire TIA registers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #0          ; A = 0
    ldx $FF         ; X = #$FF
    sta $FF         ; Make sure $FF is zeroed before the loop starts
MemLoop:
    dex             ; x--
    sta $0,X        ; Store the value of A inside memory address $0 + X
    bne MemLoop     ; Loop until X is equal to zero (z-flag is set)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size with exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
    org $FFFC
    .word Start     ; Reset vector at $FFFC (where the program starts)
    .word Start     ; Interrupt the vector at $FFFE (unused in the VCS)