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
	MOV	  AX, DATASEG	;���X .data ��segment�A�s�J AX
	MOV	  DS,AX		;


	MOV	  CX,16		;CX ��16 �� chars
	LEA	  SI,HEADNG1	;SI=HEADNG1��offset 
	LEA	  DI,HEADNG2	;DI=HEADNG2��offset
A20:
	MOV	  AL,[SI]	;AL ���o [SI](HEADNG1)��char�A��AL�s�n�ഫ��char
	MOV	  [DI+15],AL	;����r�� ��[DI+15](�̫�@��) ��Computer Science�Ĥ@��C
	INC	  SI		;INC�N��:SI++�A�U�@�ӡASI=Computer Science��o
	DEC	  DI		;DEC�N��:DI--�A���L�ܦ�[DI-1+15](�˼ƲĤG��)
	DEC	  CX		;DEC�N��:CX--�ACX=16-1=15(��15�Ӧr���n�ഫ)
	JNZ	  A20		;JNZ�N��:�Ycount������0�h���� A20�A���Ƶ{��
	MOV	  AH,09H	;��X�r���ù��A���n��ܪ��r�ꥲ���H�u$�v����
	LEA	  DX,HEADNG2	;�qHEADNG2�}�l��ܦr��
	INT	  21H		;INT�N��:�I�s���_�Ƶ{��

	MOV	  AX,4C00H	;�����{��
	INT	  21H 		;INT�N��:�I�s���_�Ƶ{��
A10MAIN	ENDP
CODESEG	ENDS
	END	  A10MAIN
