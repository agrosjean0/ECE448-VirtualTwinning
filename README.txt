Q2:

Polling Code Outputs:
1: [1 32; 1 15452.0]
2: [2 16; 1 16.0]
3: [3 12; 1 12.0]
4: [1 12; 2 12.0] 
5: [2 18; 2 18.0]
6: [3 15; 2 15.0]
7: [1 12; 3 12.0]
8: [2 13; 3 13.0]
9: [3 11; 3 11.0]
*: [1 21; 4 21.0]
0: [2 13; 4 13.0]
#: [3 6; 4 6.0]

Q3:

Interupt Code Outputs:
1: [1 58; 1 10318.0]
2: [2 56; 1 9991.0]
4: [1 51; 2 9172.0]
5: [2 79; 2 13627.0] 

Q4:

Keypad reading steps:
output_on_1_row_Z and output_on_1_column_Z functions turn on one row or column while keeping others in high impedance state.Then read_columns_Z functions scans each column by enabling one row at a time and checking the state of each column. Then read_rows_Z does the inverse.

Q5:

Polling uses significantly less calls to key_pressed than interrupt

Q6:

The data below show a significantly higher number of executables running for the interrupt code compared to the polling code. This suggests that interrupts are worse than polling for user inputs

0	Poll Times	# of Loops	Key Press Runs		ISR #	# of Loops	Key Press Runs



1a	109	109	332		33	5947	103
2a	86	86	595		57	9172	278
1b	75	75	825		44	7237	414
2b	64	64	1022		46	7536	556
5							
1a	19	19	62				
2a	24	24	139				
1b	21	21	207				
2b	24	24	350				
10							
1a	13	13	44				
2a	14	14	91				
1b	14	14	138				
2b	14	14	185				
15							
1a	12	12	41				
2a	11	11	79				
1b	8	8	108				
2b	11	11	146				
20							
1a	7	7	26				
2a	6	6	49				
1b	7	7	75				
2b	7	7	101				
25							
1a	5	5	20				
2a	5	5	40				
1b	5	5	20				
2b	9	9	92		


Q7:

Using the external button interrupt would cause inconsistent results the same is true if an interrupt is used for sleeping.

		
