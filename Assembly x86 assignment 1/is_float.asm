;******************************************************************************************
; Program name: Input floats                                                              *
; Programming Language: x86 Assembly                                                      *
; Program Description: The programs prompts the user to enter two floats and returns the  *
;                      larger number from the assembly module and the smaller number from *
;                      the C++ module.                                                    *
;******************************************************************************************
; Authors Information:                                                                    *
; Name: Sergio Murguia                                                                    *
; Email: smurguia1@csu.fullerton.edu                                                      * 
; Institution: Cal State University - Fullerton                                           *
; Course: CSPC 240-01 240-02 Assembly Language                                            *
;******************************************************************************************
;********************************************************************************************
; Copyright (C) 20202 Sergio Murguia                                                        *
; This program is free software: you can redistribute it and/or modify it under the terms   * 
; of the GNU General Public License version 3 as published by the Free Software Foundation. * 
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY  *
; without even the implied Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. * 
; See the GNU General Public License for more details. A copy of the GNU General Public     *
; License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;                                                                                           *
;********************************************************************************************
; Program information                                                                       *
;   Program name: Float input                                                               *
;   Programming languages: one modules in X86, 2 modules in c++                             *
;   Files in this program: isfloat.cpp,driver.cpp,atof                                      *
;                                                                                           *
;********************************************************************************************
; This File                                                                                 *
;    Name:      is_float.asm                                                                *
;    Purpose:   This file accepts a users two float inputs and conoverts the strings to a   *
;               a float and displayes the larger float number and return the smaller float  *
;               to the driver module.                                                       *
;********************************************************************************************



extern scanf
extern printf 
extern atof
extern isFloat
global twofloat

section .data

welcome_message db "Please enter two float seperated by whitespace. Press enter after the second input.",0
float_numbers db "%s %s",0
second_message db "These numbers where entered: %1.3lf and %1.3lf",10,0
large_number db "The larger number is %1.5lf",10,0
bad_message db "bad float",10,0
endprogram db "This assembly module will now return execution to the driver module.",10,0
endprogram2 db "The smaller number will be returned to the driver.",10,0

Section .bss


section .text
twofloat:
;back up all register first
push rbp
mov rbp,rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx 
pushf


;========Display Welcome message Asking for users inputs================================================================
mov rax,0
mov rdi,welcome_message
call printf


;========Users two inputs===============================================================================================

sub rsp, 2048
mov rax,0
mov rdi,float_numbers
mov rsi, rsp
mov rdx, rsp
add rdx, 1024
mov r15, rsp
mov r14, rdx
call scanf

;check if first string is bad input
mov rax, 0
mov rdi, r15
call isFloat
cmp rax, 0
je BadMessage

; validate second float
mov rax, 0
mov rdi, r14
call isFloat
cmp rax, 0
je BadMessage

;is a float, convert to float (first float)
mov rax, 0
mov rdi, r14
call atof
movsd xmm14, xmm0

mov rax, 0
mov rdi, r15
call atof
movsd xmm15, xmm0


;========Display users two inputs=======================================================================================

mov rax,2
mov rdi,second_message
movsd xmm0,xmm15
movsd xmm1,xmm14
call printf
;========Compare users floats to find larger float=======================================================================================
ucomisd xmm14,xmm15 ;originally had xmm14 and xmm15 save to xmm9 and xmm10 but was not returning the smaller float
ja greater
movsd xmm11, xmm15  ;had to change the register i saved my float in from xmm9 to xmm11
movsd xmm10, xmm14
jmp continue    ;jumps to the print larger block
greater:
movsd xmm11,xmm14   ; save xmm14 if its larger to xmm11
movsd xmm10,xmm15   ; xmm10 save the smalller  float value
    
 
continue:
;========Display larger float and return smaller float to driver=======================================================================================
mov rax,1
mov rdi, large_number   ;print out the larger float value
movsd xmm0,xmm11    ;larger number is save in xmm11
call printf
movsd xmm0,xmm10    ; smaller value is returned to driver



;========Jumps to end if no bad input=====================================================================================
jmp end
;========Displays bad message if user input are not floats=======================================================================================
BadMessage:
mov rax, -1
mov rdi, bad_message    ; if a users input is not a float it returns an error
call printf
;print "bad"
end:
add rsp, 2048   ;added back the 2048 bytes we subtracted
;xorpd xmm0,xmm0

;======================================================================================================================
;Restore our stack by poping all our registers
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

ret 
