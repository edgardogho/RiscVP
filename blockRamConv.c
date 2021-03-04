#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

//BlockRam initializes lines of 8wordsx8bytes each.
#define LINESIZE 8*8

//This program reads a binary files and generates the Xilinx BlockRAM
//expected INIT_XX => X".....", line structure.
int main(int argc, char *argv[]){
	FILE *readFile;
	uint8_t lineCounter=0; //Keep track of line
	uint8_t hexCounter=0; //Keep track of hex inline
	uint8_t line[LINESIZE+1]; //Buffer for line, add 1 for \n
	uint8_t hex[2+1]; //Buffer to convert byte to hex, add1 for \n
	uint8_t aux; //Buffer to read from file (single byte)
	
	//Check for proper arguments (basically a file name)
	if (argc!=2){
		printf("Error: use %s PATH_TO_FILE\n",argv[0]);
		exit(1);
	}
	readFile = fopen(argv[1],"r");
	if (readFile==NULL){
		printf("Error opening %s\n",argv[1]);
		exit(1);
	}
	
	//Init line with all 0s
	sprintf((char*)line,"0000000000000000000000000000000000000000000000000000000000000000");
	
	//Loop reading byte after byte from file
	while(!feof(readFile)){
		//Read a byte
		fread(&aux,sizeof(uint8_t),1,readFile);
		sprintf((char*)hex,"%02X",aux); //Quick and dirty byte to Hex using printf
		//Now save 2 hex on line
		line[LINESIZE-1-hexCounter]=hex[1];
		line[LINESIZE-2-hexCounter]=hex[0];
		hexCounter+=2;
		
		//If it reaches end of line...
		if (hexCounter>(LINESIZE-1)){
			//Convert line counter also to hex
			sprintf(hex,"%02X",lineCounter);
			//Now print the line in Xilinx BLOCKRAM format
			printf("\tINIT_%c%c => X\"%s\",\n",hex[0],hex[1],line);
			//Increase line counter and reset hex counter and line
			lineCounter++;
			hexCounter=0;
			sprintf((char*)line,"0000000000000000000000000000000000000000000000000000000000000000");
		}
	}
	//There is always one last line to print, even if its all just 0s
	sprintf(hex,"%02X",lineCounter);
	printf("\tINIT_%c%c => X\"%s\",\n",hex[0],hex[1],line);

	//So long
	return 0;
}
