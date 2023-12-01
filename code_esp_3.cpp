
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


    for(int i = 0; i < n; i++){ //Preenche os vetore C  e D, C com a soma por elemento de A e B, e D com a subtracao
        C[i] = A[i] + B[i];
        D[i] = A[i] - B[i];
    }

    cout << "Vetor C : ";   

    for(int i = 0; i < n; i++){ //mostra vetor C
        cout << C[i] << " ";
    }

    cout << endl;  

    cout << "Vetor D : ";

    for(int i = 0; i < n; i++){ //mostra vetor D
        cout << D[i] << " ";
    }

    cout << endl;

    int maxNum = C[0];  //inicializa maxNum com o primeiro valor de C

    for(int i = 0; i < n; i++){ //encontra o maior valor entre os vetores C e D
        if(C[i] > maxNum)
            maxNum = C[i];

        if(D[i] > maxNum)
            maxNum = D[i];
    }

    cout << "Maior numero: " << maxNum << endl;

    int sM = 0; //inicializa a soma

    for(int i = 0; i < n; i++){ // soma os vetores
        sM += C[i] + D[i];
    }

        cout << "A soma dos vetores é: " << sM << endl;

    sM = multiply(sM, maxNum); //chama a função para realizar a multiplicação por somas sucessivas

    cout << "O resultado do maior nunero multiplicado pela soma é : " << sM << endl;

    return 0;
}