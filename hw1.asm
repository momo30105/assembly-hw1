TITLE	A06MOVE (EXE)  Repetitive move operations
;---------------------------------------------------------
STACK	  SEGMENT	PARA	STACK	'Stack'
	DB	64 DUP(0)
STACK	  ENDS
;---------------------------------------------------------
DATASEG   SEGMENT	PARA	'Data'
HEADNG1	  DB	  'Computer Science'
HEADNG2	  DB	  16 DUP ('a'), '$'
DATASEG	  ENDS
;---------------------------------------------------------
CODESEG	  SEGMENT	PARA	'Code'
A10MAIN	PROC   FAR
	MOV	  AX, DATASEG	;取出 .data 的segment，存入 AX
	MOV	  DS,AX		;


	MOV	  CX,16		;CX 為16 個 chars
	LEA	  SI,HEADNG1	;SI=HEADNG1的offset 
	LEA	  DI,HEADNG2	;DI=HEADNG2的offset
A20:
	MOV	  AL,[SI]	;AL 取得 [SI](HEADNG1)的char，讓AL存要轉換的char
	MOV	  [DI+15],AL	;反轉字串 讓[DI+15](最後一位) 為Computer Science第一個C
	INC	  SI		;INC意思:SI++，下一個，SI=Computer Science的o
	DEC	  DI		;DEC意思:DI--，讓他變成[DI-1+15](倒數第二位)
	DEC	  CX		;DEC意思:CX--，CX=16-1=15(剩15個字元要轉換)
	JNZ	  A20		;JNZ意思:若count不等於0則跳到 A20，重複程式
	MOV	  AH,09H	;輸出字串到螢幕，但要顯示的字串必須以「$」結束
	LEA	  DX,HEADNG2	;從HEADNG2開始顯示字串
	INT	  21H		;INT意思:呼叫中斷副程式

	MOV	  AX,4C00H	;結束程式
	INT	  21H 		;INT意思:呼叫中斷副程式
A10MAIN	ENDP
CODESEG	ENDS
	END	  A10MAIN
