# include<stdio.h>

int greet(int a) {
    if(a==1) {
        return 1;
    }
    else{
        return a-1 + greet(a-1);
    } 
}

int main() {
    greet(5);
    return 0;
}

