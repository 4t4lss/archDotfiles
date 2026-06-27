#include <iostream>

int iterFib(int userIn){
    int result {}, firstTerm{0}, secondTerm{1};

    for(int i = 0; i < userIn; ++i){
        result = firstTerm + secondTerm;
        firstTerm = secondTerm;
        secondTerm = result;
    }

    return firstTerm;
}

int recFib(int userIn){
    int result{};

    if(userIn<=1)
        result = userIn;
    else
         result = recFib(userIn-2) + recFib(userIn-1);

    return result;
}

int main(){
    int userInput{};
    int result{};

    std::cout << "\nIteratively:";
    while(std::cin >> userInput && userInput >= 0){
        result = iterFib(userInput);
        std::cout << "Fib(" << userInput << "): " << result << '\n';
    }

    std::cout << "\nRecursivly:";
    while(std::cin >> userInput && userInput > -1){
        result = recFib(userInput);
        std::cout << "Fib(" << userInput << "): " << result << '\n';
    }

    return 0;
}
