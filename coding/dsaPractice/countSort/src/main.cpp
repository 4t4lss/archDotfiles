#include <iostream>

/*
 * Stable: [yes] no
 * Count sort is very fast for small lists where elements are almost consecutive and/or enums and chars.
 * However, count sort uses a lot of memory when elements get larger or when elements aren't as consecutive.
 * Count sort does not work with negative elements.
 */
void countSort(int arr[], int size){
    int max, min;
    max = min = arr[0];
    for(int i{1}; i < size; ++i){
        if(max < arr[i]) max = arr[i];
        if(min > arr[i]) min = arr[i];
    }
    int range{max-min+1};
    int* freq = new int[range]{};
    for(int i{0}; i < size; ++i){
        ++freq[arr[i]-min];
    }
    //prefix array
    for(int i{1}; i <= range; ++i){
        freq[i] += freq[i-1];
    }
    int* output = new int[size];
    //array reconstruction
    for(int i{size-1}; i >= 0; --i){
        output[--freq[arr[i]-min]] = arr[i];
    }
    for(int i{0}; i < size; ++i){
        arr[i] = output[i];
    }
    delete[] output;
    delete[] freq;
}

int main(){
    int arr[] = {1,4,6,2,8,9,10,-5,13,15,-1,3,9,1};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before count sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter count sort: \n";
    countSort(arr, size);
    for(int i {0}; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}
