# You will be given two arrays of integers and asked to determine all integers that satisfy the following two conditions:

# The elements of the first array are all factors of the integer being considered
# The integer being considered is a factor of all elements of the second array
# These numbers are referred to as being between the two arrays. You must determine how many such numbers exist.

# For example, given the arrays  and , there are two numbers between them:  and . , ,  and  for the first value. Similarly, ,  and , .

# Function Description

# Complete the getTotalX function in the editor below. It should return the number of integers that are betwen the sets.

# getTotalX has the following parameter(s):

# a: an array of integers
# b: an array of integers
# Input Format

# The first line contains two space-separated integers,  and , the number of elements in array  and the number of elements in array .
# The second line contains  distinct space-separated integers describing  where .
# The third line contains  distinct space-separated integers describing  where .

# Constraints

# Output Format

# Print the number of integers that are considered to be between  and .

# Sample Input

# 2 3
# 2 4
# 16 32 96
# Sample Output

# 3
# Explanation

# 2 and 4 divide evenly into 4, 8, 12 and 16.
# 4, 8 and 16 divide evenly into 16, 32, 96.

# 4, 8 and 16 are the only three numbers for which each element of a is a factor and each is a factor of all elements of b.

arr_1 = [2, 4]
arr_2 = [16,32,96]

# arr_1 = [2,6]
# arr_2 = [24,36]

arr_1_counter = Hash.new(0)
arr_1_results = []
final_result = 0

#for each element in arr_1, increment hash value for each number that the index is a factor of while the numbers is less than or equal to the lowest number in arr_2
arr_1.each do |number|
    temp_number = 0
    while temp_number < arr_2.min
        temp_number += number
        unless temp_number == arr_2.min
            arr_1_counter[temp_number] += 1
        end
    end
end
p arr_1_counter

#push each key that has a value of arr_1.length into a new arr_1_results array
arr_1_counter.each do |k,v|
    if v == 2
        arr_1_results << k
    end
end
p arr_1_results

#loop through arr_2 and divide each index by each value in arr_1_reults array. If index % arr_1_results[i] = 0, increment counter

arr_1_results.each do |arr_1_results_number|
    counter = 0
    arr_2.each do |arr_2_number|
        if arr_2_number % arr_1_results_number == 0
            counter += 1
        end
    end
    if counter == arr_2.length
        final_result += 1
    end
end

p final_result  
        