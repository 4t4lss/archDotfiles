#include <iostream>

void selectionSort(int arr[], int size){
    for(int i = 0; i < size-1; ++i){
        int minNdx {i};
        for(int j = i+1; j < size; ++j){
            if(arr[j] < arr[minNdx])
                minNdx = j;
        }
        if(minNdx > i){
            int temp {arr[i]};
            arr[i] = arr[minNdx];
            arr[minNdx] = temp;
        }
    }
}

int main(){
    int arr[] = {1,4,6,2,8,9,321,5,865,42,1,3,9,0};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before selection sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter selection sort: \n";
    selectionSort(arr, size);
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}

