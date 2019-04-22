b my_instruction
plot R1,R5
mov R1, R4
my_instruction:
    plot R1,R0
    mov R1,R2

    add R1,R2,R2
    add R1,R2,#0
    
    sub R1,R2,R2
    
    sub_ R1,R2,#10

    adds R1,R2,R2
    adds R1,R2,#10

    b my_instruction
    bmi my_instruction
    beq my_instruction

    COL @000
    COL @001
    COL @000
    COL @011
    COL @100
    COL @101
    COL @110
    COL @111

    COL @BLACK
    COL @BLUE
    COL @GREEN
    COL @CYAN
    COL @RED
    COL @MAGENTA
    COL @YELLOW
    COL @WHITE

    COL @Black
    COL @Blue
    COL @Green
    COL @Cyan
    COL @Red
    COL @Magenta
    COL @Yellow
    COL @White

    COL @black
    COL @blue
    COL @green
    COL @cyan
    COL @red
    COL @magenta
    COL @yellow
    COL @white

    EOR R1,R2,R2