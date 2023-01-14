    processor 6502

    include "vcs.h"
    include "macro.h"

    seg code
    org $F000               ; defines the origin of ROM at $F000

START:
    ;CLEAN_START             ; Macro to safely clean the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    lda #$7C               ; Load color into A ($1E is NTSC yellow)
    sta COLUBK              ; Store A to backgroundColor Address $09
    jmp START               ; Repeat from START

    org $FFFC
    .word START
    .word START
