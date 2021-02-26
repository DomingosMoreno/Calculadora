#include<stdio.h>
#include<stdlib.h>

/*mostra apenas mensagens*/
void msg(char *ptr)
{
    puts(ptr);
    exit(1);
}

int main()
{
    float valor1=0, valor2=0;
 //   int entrada1=1,entrada2=1; /*vai testar como verdadeiro e falso*/
    int vazio=0;
    FILE *fptr=NULL;


    printf("Introduza o primeiro operando : ");
    scanf("%f",&valor1);

    printf("Introduza o segundo operando  : ");
    scanf("%f",&valor2);

     fflush(stdin);


    fptr =  fopen("dados\\armazenamento1.txt","w");
    if(fptr==NULL)
    {
        msg("Erro ao abrir arquivo armazenamento1.txt!!!");
    }
    fprintf(fptr,"%.2f",valor1);
    fclose(fptr);
    fptr =  fopen("dados\\armazenamento2.txt","w");
    if(fptr==NULL)
    {
        msg("Erro ao abrir arquivo armazenamento2.txt!!!");
    }
    fprintf(fptr,"%.2f",valor2);
    fclose(fptr);



}
