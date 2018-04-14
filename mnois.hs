--Takes in a index, element, list and it returns a new copy of the list new the new element at the index
replaceAtIndex :: Int -> Int -> [Int] -> [Int]
replaceAtIndex n newElement xs = take n xs ++ [newElement] ++ drop (n + 1) xs

--Builds the row of the Preprocessed array by determining each value of the array 
buildRow :: Int -> Int -> [Int] -> [Int]
buildRow i n array = do
    let row = [buildCol i j array row | j<-[0..n-1]]
    row

--Calls the calculation each value in the row for the prepossessed array
buildCol :: Int -> Int -> [Int] -> [Int] -> Int
buildCol i j array row
    |j == i = 1
    |j >= i = maximum [calcVal j k array row| k<-[i..j-1]]
    |otherwise = 0

--Calculates the value of the preprosses array by checking the input values 
calcVal :: Int -> Int -> [Int] -> [Int] -> Int
calcVal j k array list = if array!!k < array!!j
    then 1 + list!!k
    else 1

--Initializing the array that will store the highest number of elements that can be used in valid subsequences
buildlongSubseq :: Int -> Int -> [[Int]] -> Int
buildlongSubseq i k list
    |head list!!i >= k = head list!!i
    |otherwise = 0

--Creates the array that folds the results of the lookup, and returns the max subsequence for the current k value
findSub :: Int -> Int -> [[Int]] -> Int
findSub k n list = do
    let longSubseq = [buildlongSubseq i k list | i<-[0..n-1]]
    let longSubseqList = [loopReplace n i (n-1) k list (if i == 0 then longSubseq else longSubseqList!!(i-1))|i<-[0..n-1]]

    maximum (last longSubseqList)

--Loops through the replace function for ever value of j
loopReplace :: Int -> Int -> Int -> Int -> [[Int]] -> [Int] -> [Int]
loopReplace n i j k list longSubseq
    |j == 0 || j < i+1 = longSubseq
    |otherwise = replacelongSubseq i j k (list!!(i+1)!!j) (loopReplace n i (j-1) k list longSubseq)

--Check to see if we can append a new subsequence onto the enlongSubseqoint of each other sequence
replacelongSubseq:: Int -> Int -> Int -> Int -> [Int] -> [Int]
replacelongSubseq i j k index longSubseq
    |index >= k && index + lseq > longSubseq!!j = replaceAtIndex j (index + lseq) longSubseq
    |otherwise = longSubseq
    where lseq = longSubseq!!i

--Runs the calculations the number of times specified by the user
doCases::Int -> IO ()
doCases 0 = return ()
doCases num = do

    nStr <- getLine
    let n = read nStr :: Int --Number of values in case

    arrayStr <- getLine
    let array = map read $ words arrayStr :: [Int] --Values in the case

    let list = [buildRow i n array | i<-[0..n-1]] --Preprocesses the input values

    let answer = [findSub k n list | k <- [1..n]] --Determines the answer for each value of k

    putStrLn (unwords (map show answer)) --Print out the answer array as a string seperated by spaces
    doCases (num-1)


main :: IO() 
main = do 

    casesStr <- getLine
    let cases = read casesStr :: Int
    doCases cases
    