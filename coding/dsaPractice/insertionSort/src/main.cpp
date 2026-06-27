#include <iostream>

void insertionSort(int arr[], int size){
    for(int i = 1; i < size; ++i){
        int key {arr[i]};
        int j {i-1};
        while(j >= 0 && arr[j] > key){
            arr[j+1] = arr[j];
            --j;
        }
        arr[j+1] = key;
    }
}

int main(){
    int arr[] = {1,4,6,2,8,9,321,5,865,42,1,3,9,0};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before insertion sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter insertion sort: \n";
    insertionSort(arr, size);
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}
