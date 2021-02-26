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
    float numero1=0,numero2=0,resultado=0;
    FILE *fptr=NULL;


    /*depois procurar tratar erros qnd não encontrado um ficheiro*/
    fptr =  fopen("dados\\armazenamento1.txt","r");
    if(fptr==NULL)
    {
        msg("Erro ao abrir arquivo armazenamento1.txt!!!");
    }
    /*depois tratar erros quando um usuário modifica um arquivo txt*/
    fscanf(fptr,"%f",&numero1);
    fclose(fptr);
    /*abrir um outro ficheiro amazenamanto2.txt para a segunda variável*/
    fptr =  fopen("dados\\armazenamento2.txt","r");
     if(fptr==NULL)
    {
        msg("Erro ao abrir arquivo armazenamento2.txt!!!");
    }
    fscanf(fptr,"%f",&numero2);
    fclose(fptr);
    resultado = numero1*numero2;
    /*criar um ficheiro para gravar o resultado*/
    fptr  = fopen("resultado.txt","w");
    if(fptr==NULL)
    {
        msg("Erro ao gravar o resultado ao multiplicar!!!");
    }
    fprintf(fptr,"%.2f",resultado);
    fclose(fptr);



}
