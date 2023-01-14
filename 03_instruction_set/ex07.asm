    processor 6502
    seg Code
    org $F000

Start:
    lda #10
    sta $80

    inc $80     ; Increment the value inside a (zero page) memory position $80
    dec $80     ; Decrement the value inside a (zero page) memory position $80

    org $FFFC
    .word Start
    .word Start