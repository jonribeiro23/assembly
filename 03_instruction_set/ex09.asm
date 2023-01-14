    processor 6502
    seg Code
    org $F000

Start:
    sei
    lda #1

Loop:
    clc
    adc #1
    cmp #10
    bne Loop

    org $FFFC
    .word Start
    .word Start