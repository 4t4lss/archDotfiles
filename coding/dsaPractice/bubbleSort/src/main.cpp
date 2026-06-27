#include <iostream>

void bubbleSort(int arr[], int size){
    for(int i = 0; i < size-1; ++i){
        bool swapped {false};
        for(int j = 1; j < size-i; ++j){
            if(arr[j-1] > arr[j]){
                int temp = arr[j-1];
                arr[j-1] = arr[j];
                arr[j] = temp;
                swapped = true;
            }
        }
        if(swapped)
            break;
    }
}

int main(){
    int arr[] = {1,4,6,2,8,9,321,5,865,42,1,3,9,0};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before bubble sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter bubble sort: \n";
    bubbleSort(arr, size);
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}
