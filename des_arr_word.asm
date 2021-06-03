DS1 SEGMENT    
    
LIST  DW   02h, 07h,01h,08h,03h
N     EQU  05h

DS1 ENDS
         
         
SS1 SEGMENT
DW 10H DUP(?)
SS1 ENDS  
        
        
CS1 SEGMENT
ASSUME DS:DS1 ,SS:SS1 ,CS:CS1 

START:  MOV AX,DS1
        MOV DS,AX
                      
                      
        MOV DX, N         
BACK:   MOV CX, DX
        MOV SI, OFFSET LIST
        
AGAIN:  MOV AX, [SI]
        CMP AX, [SI + 2]
        JGE GO  
        
        XCHG [SI + 2], AX 
        XCHG [SI], AX   
        
GO:     INC SI
        INC SI
        LOOP AGAIN
        DEC DX
        JNZ BACK

SOF: MOV AH, 4CH
     INT 21H
     CS1 ENDS     

END START
