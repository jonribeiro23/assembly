    processor 6502
    seg Code
    org $F000

Start:
    sei
    lda #100

    clc         ; We always clear carry flag before calling adc
    adc #5

    sec         ; We always set the carry flag before calling sbc
    sbc #10

    org $FFFC
    .word Start
    .word Start