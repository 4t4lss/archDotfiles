#include <iostream>


int main(){
    int x{};
    [[maybe_unused]] int y{};

    std::cout << "Enter three numbers: ";
    std::cin >> x;
    std::cout << "nYou entered " << x << ',';
    std::cin >> x;
    std::cout << " " << x << ',';
    std::cin >> x;
    std::cout << " and " << x << ".\n";

    return 0;
}
