; shark sim 3000
USE32
section .data
s: times 20 db 7eh
    db 5eh, 7eh, 0dh
.L equ $-s

section .text
global _start
_start: 
    mov esi, s.L-1
.p:
    mov ebx, 1 ; move 1 into ebx reg. ebx is base register base pointer
    mov ecx, s+s.L ;ecx counter register fore loops and shifts
    sub ecx, esi ;subtract esi from ecx. esii is source index reg
    mov edx, esi ;move esi val int edx val. edx is data register
    mov eax, 4 ; move number into eax register for arithmatic (sp?)
    int 0x80 ;interrupt program
    mov ecx, 0xfffffff ;move 5 into counter register
    loop $ ;
    dec esi ;decrememnt the esi register
    jnz .p  ;if eax isn't 0 jump to start to .p
    mov ebx, 0 
    mov eax, 1 
    int 0x80 
