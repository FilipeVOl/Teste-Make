#include <assert.h>
#include <stdio.h>

int main() {
    printf("Rodando teste: 1 + 1 == 2...\n");
    assert(1 + 1 == 2);
    printf("Teste passou!\n");
    return 0;
}
