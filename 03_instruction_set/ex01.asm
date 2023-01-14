    processor 6502

    seg code
    org $F000
Start:
    LDA #$82
    LDX #82
    LDY $82

    org $FFFC
    .word Start
    .word Start
