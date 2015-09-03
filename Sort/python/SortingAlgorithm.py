#-*- coding: utf-8 -*-

#---------------------
#   程序：排序算法
#   语言：python 3.4
#   时间：2015-09-02
#   作者：WangZhe
#   许可：BY-NC
#---------------------

#   排序分类：
#   插入排序：直接插入排序、希尔排序
#   选择排序：直接选择排序、冒泡排序、快速排序
#   其他排序：归并排序、堆排序

#   直接插入排序
def insert_sort(array):
    n = len(array)
    for i in range(1, n):
        for j in range(i-1, -1, -1):
            if array[j+1] < array[j]:       #找到合适插入的位置
                array[j], array[j+1] = array[j+1], array[j]
    return array

#   希尔排序
def shell_sort(array):
    n = len(array)
    gap = int(n/2)
    while gap > 0:
        for i in range(gap, n):
            for j in range(i-gap, -1, -1):
                if array[j+gap] < array[j]:
                    array[j], array[j+gap] = array[j+gap], array[j]
        gap = int(gap/2);
    return array

#   直接选择排序
def select_sort(array):
    n = len(array)
    for i in range(0, n):
        min = i
        for j in range(i+1, n):
            if array[j] < array[min]:      #在未排序序列中寻找最小值
                min = j
        array[min], array[i] = array[i], array[min]
    return array

#   冒泡排序（优化）
def bubble_sort(array):
    n = len(array)
    k = n       #缩小循环范围
    for i in range(n):
        flag = 1    #记录是否有交换
        for j in range(1, k):
            if array[j-1] > array[j]:
                array[j-1], array[j] = array[j], array[j-1]
                k = j       #记录最后一次交换的位置，其后已有序
                flag = 0
        if flag:        #无交换时，提前结束
            break
    return array

#   快速排序
#   分治思想：分解、解决、合并
def partition(array, left, right):
    x = array[right]    #最后一个元素作为分界
    i = left
    for j in range(left, right):
        if array[j] <= x:
            array[i], array[j] = array[j], array[i]
            i += 1
    array[i], array[right] = array[right], array[i]
    return i;

def qsort(array, left, right):
    if left < right:
        mid = partition(array, left, right)
        qsort(array, left, mid-1)
        qsort(array, mid+1, right)

def quick_sort(array):
    right = len(array)-1
    qsort(array, 0, right)
    return array


#   归并排序
#   分治思想：分解、解决、合并
def merge(left, right):
    i, j = 0, 0
    result = []
    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    result += left[i:]
    result += right[j:]
    return result

def merge_sort(array):
    if len(array) > 1:
        mid = int(len(array)/2)     #分解
        left = merge_sort(array[:mid])
        right = merge_sort(array[mid:])
        return merge(left, right)       #合并
    else:
        return array




