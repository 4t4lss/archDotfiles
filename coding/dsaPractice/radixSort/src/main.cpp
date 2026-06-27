#include <iostream>

void countSort(int arr[], int size){
    if(size <= 1) return;
    int min, max, range, *output, *freq;   
    min = max = arr[0];
    output = new int[size];
    for(int i{0}; i < size; ++i){
        if(max < arr[i]) max = arr[i];
        if(arr[i] < min) min = arr[i];
    }
    range = max-min+1;
    freq = new int[range];
    for(int i{0}; i < size; ++i){
        ++freq[arr[i]-min];
    }
    for(int i{1}; i < range; ++i){
        freq[i]+=freq[i-1];
    }
    for(int i{size-1}; i >= 0; --i){
        output[--freq[arr[i]-min]] = arr[i];
    }
    delete[] freq;
    delete[] output;
}

void radixSort(int arr[], int low, int high){

}

int main(){
    int arr[] = {1,4,6,2,8,9,321,5,865,42,1,3,9,0};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before radix sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter radix sort: \n";
    radixSort(arr, 0, size-1);
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}
