import random
from SortingAlgorithm import *

unsorted_array = [random.randint(1,99) for i in range(10)]

print("排序前："+str(unsorted_array))
print('---------------------------')

array = unsorted_array[:]
sorted_arry = quick_sort(array)
print("快速排序："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = bubble_sort(array)
print("冒泡排序："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = insert_sort(array)
print("直接插入："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = shell_sort(array)
print("希尔排序："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = select_sort(array)
print("直接选择："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = merge_sort(array)
print("归并选择："+str(sorted_arry))

array = unsorted_array[:]
sorted_arry = heap_sort(array)
print("堆排序："+str(sorted_arry))
