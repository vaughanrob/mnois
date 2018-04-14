# Maximum Non-Overlapping Increasing Subsequences

Given a list of integers, we can find an increasing subsequence from that list, i.e., select specific elements from the list where the selected numbers are in increasing order. There is a classic problem that asks to find the longest increasing subsequence, i.e., increasing subsequence with the maximum number of elements. In our problem, we are going to do a modified version of that problem. Instead of finding one increasing subsequence, we will find multiple increasing subsequences with the following two constraints:

  1. The length of each subsequence should be at least of a given size k.
  2. If a subsequence starts at index i and ends at index j, no other subsequence can start or end in the range i to j      (inclusive), i.e., no other subsequence can have any elements in between index i and j (inclusive), i.e., the subsequences cannot overlap.
  
The objective is to find subsequences (satisfying the above two conditions) resulting in the maximum number of elements being selected, i.e., the total number of elements in all these subsequences combined is the maximum.
For example, consider the list 2 1 9 3 4 4 5 6.

If k = 2, we can get three non-overlapping increasing subsequences with maximum of 7 elements: [2, 9], [ 3, 4], [4, 5, 6].
If k = 3, we can get two non-overlapping increasing subsequences with maximum of 6 elements:
[2, 3, 4], [ 4, 5, 6].

The Problem:
Given a list of n integers, determine the maximum number of integers you can include in the non-overlapping increasing subsequences for all k where 1 ≤ k ≤ n.

The Input:
The first input line contains an integer, t (1 ≤ t ≤ 50), indicating the number of test cases to process. Each test case starts with an integer, n (1 ≤ n ≤ 100), indicating the number of integers in the list. The second line of each test case contains the list of n integers (each in the range of -106 to 106, inclusive).
The Output:

For each test case, output n integers (on a single line) indicating, respectively, the maximum number of integers in the non-overlapping subsequences for all k where 1 ≤ k ≤ n.
