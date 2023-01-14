    processor 6502
    seg Code
    org $F000

Start:
    sei
    ldy #10    ; Initialize the Y register with the decimal value 10

Loop:
    tya
    sta $80,y
    dey
    bpl Loop    ; Branch if puls (result of last instruction was positive)


    org $FFFC
    .word Start
    .word Start