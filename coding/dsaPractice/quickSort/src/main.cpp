#include <iostream>

int partition(int arr[], int left, int right){
    bool done {false};
    int pivot {arr[left + (right-left)/2]};
    
    while(!done){
        while(arr[left] < pivot){
            ++left;
        }
        while(arr[right] > pivot){
            --right;
        }
        if(left >= right)
            done = true;
        else{
            int temp {arr[left]};
            arr[left] = arr[right];
            arr[right] = temp;
            ++left;
            --right;
        }
    }

    return right;
} 

void quickSort(int arr[], int low, int high){
    if(low>=high)
        return;
    int p {partition(arr, low, high)};
    quickSort(arr, low, p);
    quickSort(arr, p+1, high);
}

int main(){
    int arr[] = {1,4,6,2,8,9,321,5,865,42,1,3,9,0};
    int size {sizeof(arr)/sizeof(arr[0])};
    
    std::cout << "Before quick sort: \n";
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }

    std::cout << "\nAfter quick sort: \n";
    quickSort(arr, 0, size-1);
    for(int i = 0; i < size; ++i){
        std::cout << arr[i] << ", ";
    }
    std::cout << '\n';

    return 0;
}
