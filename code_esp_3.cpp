// Código em C
// 1. Crie uma sub-rotina que calcule o somatório de dois vetores multiplicado pelo valor máximo deles (SM -> máximo vezes somatório).
// 2. Calcule o somatório dos vetores C e D, que foram obtidos na ESPECIFICAÇÃO GERAL, multiplicado pelo valor máximo deles.
// 3. Salve o resultado em uma variável (SM) na memória.

#include <iostream>

using namespace std;

int multiply(int a, int b){
    int acumula = 0;
    int vezes = b;

    // se B é negativo, troca o sinal
    if(b < 0)
        vezes = 0 - vezes;

    // acumula A, B vezes
    while(vezes!=0){
        acumula = acumula + a;
        vezes = vezes - 1;
    }

    // se B é negativo, trocamos o sinal do resultado
    if(b < 0)
        acumula = 0 - acumula;

    return acumula;
}

int main() {
    int n = 8;

    int A[n] = {2,8,-24,4,12,-2,4,3};
    int B[n] = {7,-12,5,12,15,8,11,-7};
    int C[n] = {};
    int D[n] = {};


    for(int i = 0; i < n; i++){
        C[i] = A[i] + B[i];
        D[i] = A[i] - B[i];
    }

    cout << "Vetor C : ";

    for(int i = 0; i < n; i++){
        cout << C[i] << " ";
    }

    cout << endl;  

    cout << "Vetor D : ";

    for(int i = 0; i < n; i++){
        cout << D[i] << " ";
    }

    cout << endl;

    int maxNum = C[0];

    for(int i = 0; i < n; i++){
        if(C[i] > maxNum)
            maxNum = C[i];

        if(D[i] > maxNum)
            maxNum = D[i];
    }

    cout << "Maior numero: " << maxNum << endl;

    int sM = 0;

    for(int i = 0; i < n; i++){
        sM += C[i] + D[i];
    }

    cout << "A soma dos vetores é: " << sM << endl;

    sM = multiply(sM, maxNum);

    cout << "O resultado do maior nunero multiplicado pela soma é : " << sM << endl;

    return 0;
}