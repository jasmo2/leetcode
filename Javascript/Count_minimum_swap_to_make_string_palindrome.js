/*
Given a string s, the task is to find out the minimum no of adjacent swaps
required to make string s palindrome. If it is not possible, then return -1.

Example:
 Input: aabcb
 Output: 3
 Explanation:
 After 1st swap: abacb
 After 2nd swap: abcab
 After 3rd swap: abcba
 Input: adbcdbad
 Output: -1
*/
String.prototype.replaceAt = function(index, replacement) {
    return this.substr(0, index) + replacement + this.substr(index + replacement.length);
}

function CountSwap(s) {
    let str = s
    console.log('CountSwap')
    const n = s.length
    let counter = 0
    const mid = Math.floor(n /2)

    for (let i = 0; i < mid; i++) {
        console.log(i)
        let left = i
        let right = n - left - 1

        while (left < right) {
            // console.log('str[left]',str[left])
            // console.log('str[right]',str[right])
            // console.log('----')
            if (str[left] === str[right]) {
                break
            } else {
                right--
            }
        }

        if (left === right) {
            return -1
        }

        // The following loop will swap the characters
        for (let j = right; j < n - left - 1; j++) {
            const temp = str[j]
            const temp2 = str[j+1]
            str = str.replaceAt(j, temp2)
            str = str.replaceAt(j+1, temp)
            counter++

            console.log("after swap s:", str)
        }
    }

    return counter
}
// Driver Code
const s = 'geeksfgeeks'
const rS = s.split("").reverse().join("")

// Length of string

const ans = CountSwap(s)
console.log("ans: ",ans)
