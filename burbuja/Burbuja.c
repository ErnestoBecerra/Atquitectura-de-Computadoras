#include<stdio.h>
#include<stdlib.h>

void crearVector(int *);
void mostrarArreglo(int *);
void burbuja(int *);
void mostrarBurbuja(int *);

int main(){
	int vector[20];

	crearVector(vector);
	mostrarArreglo(vector);	
	burbuja(vector);
	mostrarBurbuja(vector);
	return 0;
}


void crearVector(int *vec){
	srand(time(NULL));
	int i;
	for(i=0; i<20;i++){
		vec[i] = 0 + rand()%(100-0+1);
		
	}
	
}

void mostrarArreglo(int *vec){
	int i;
	printf("Se muestra arreglo sin acomodar\n");
	for(i =0; i<20;i++){
		printf("%d, ", vec[i]);
	}
	printf("\n");
}

void burbuja(int *vec){
	int j,k,aux;
	for(j=0; j<20; j++){
		for(k=0; k<20; k++){
			if(vec[k]>vec[k+1]){
				aux = vec[k+1];
				vec[k+1] = vec[k];
				vec[k] = aux;	
			}
		}
	}	
}

void mostrarBurbuja(int *vec){
	int l;
	printf("\nSe muestra arreglo ordenado mediante ordenamiento de burbuja:\n");
	for(l=0;l<20;l++){
		printf("%d, ",vec[l]);
	}
	printf("\n");
}

