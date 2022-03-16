START: MOV BL, 60; a= 60
       MOV CL, 60; b= 60
       MOV DL, 60; c= 60
       
       ADD BL, 30
       SUB DL, 30
       
       ADD AH,BL ;sum angles
       ADD AH,CL
       ADD AH,DL
             
             
       CMP AH,180 ;check if angles > 180
       JA ERROR
       CMP AH, 0  ;check if angles < 0
       JB ERROR 
       
       SUB AH,BL ;remove sum angles
       SUB AH,CL
       SUB AH,DL
              
              
              
       ADD BH, BL 
       ADD BH, CL
       ADD DH, DL 
       ADD DH, CL
       
       CMP BH, DH ;a + b <= c + b
       JBE CHECKC
       CMP BL ,CL; a < b
       JA ISA91
       CMP CL,91; b < 91
       JB CHECKBC1
       CMP CL,DL   ; b => c
       JAE CHECKBC2
       JMP REGULAR 
       
       
CHECKC: ADD CH,BL
        ADD CH,CL
        CMP CH,DH ;a + b < c + b
        JB ISC90  
        JMP EQUILATERAL 
        
ISC90:  CMP DL, 91  ;c < 91
        JB CHECKAB1
        CMP BL, CL  ;a > b
        JAE CHECKAB2
        JMP REGULAR
        
CHECKAB1:CMP BL, CL  ;a => b
         JAE CHECKB1
         JMP RIGHT 

CHECKAB2:CMP BL, CL    ;a>b
         JA REGULAR
         JMP ISOSCELES 
                       
        
CHECKB1:CMP BL, CL   ;a>b
        JA RIGHT
        JMP RIG-ISO     
    
    
    
     
ISA91:  CMP BL, 91 ; a < 91
        JB CHECKBC1
        CMP CL ,DL   ; b => c
        JAE CHECKBC2
        JMP REGULAR  
        
        
CHECKBC1:CMP CL,DL  ; b => c
         JAE CHECKB2
         JMP RIGHT    
         
         
CHECKBC2:CMP CL,DL  ; b > c
         JA REGULAR
         JMP ISOSCELES   
         
          
CHECKB2:CMP CL,DL ; b > c
        JA RIGHT
        JMP RIG-ISO 
        
                           
       

            


SOF: mov ax, 4c00h ; exit to operating system
    int 21h   
                                       
                       

ERROR: JMP SOF   
            
               
NO: ADD AL, 0
       JMP SOF  

RIGHT: ADD AL, 1
       JMP SOF   

ISOSCELES: ADD AL, 2
           JMP SOF 

RIG-ISO: ADD AL, 3
         JMP SOF 

EQUILATERAL: ADD AL, 6
             JMP SOF  

REGULAR: ADD AL, 8
         JMP SOF
