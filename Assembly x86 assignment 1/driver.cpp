/******************************************************************************************
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
;    Name:      driver.cpp                                                                  *
;    Purpose:   Diplays the welcome message and then calls two floats which then return the *
;               smaller float number                                                        * 
;********************************************************************************************/



#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>
#include <iostream>
extern "C" double twofloat();
int main(int argc, char* argv[])
{
    double mystery_number = 0.0;
    std:: cout <<"Welcome to Floating Point Numbers programmed by Sergio Murguia.\n";
    std:: cout << "Mr.Murguia has been working for the Longstreet Software Company for the last two years.\n";
    mystery_number = twofloat();
    printf("The driver module recieved this float number %1.1lf.",mystery_number);
    printf(" and will keep it.\n");
    printf("The driver module will return integer 0 to the operating system.\n");
    printf("Have a nice day, Good-bye.\n");
    return 0;

}