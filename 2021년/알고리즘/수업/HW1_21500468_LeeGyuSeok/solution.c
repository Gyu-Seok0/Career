#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int main(){
	char arr[1024];
	scanf("%[^\n]", arr);
	printf("%s\n", arr);
}