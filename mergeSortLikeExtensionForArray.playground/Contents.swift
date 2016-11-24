// MergeSort()

extension Array where Element: Comparable {
    
    private func merge(_ leftPile: [Element], and rightPile: [Element]) -> [Element] {
        
        var leftIndex = 0
        var rightIndex = 0
        
        var orderPile = [Element]()
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            if leftPile[leftIndex] < rightPile[rightIndex] {
                orderPile.append(leftPile[leftIndex])
                leftIndex += 1
            } else if leftPile[leftIndex] > rightPile[rightIndex] {
                orderPile.append(rightPile[rightIndex])
                rightIndex += 1
            } else {
                orderPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderPile.append(rightPile[rightIndex])
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPile.count {
            orderPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderPile
    }
    
    public func mergeSort() -> [Element] {
        
        guard self.count > 1 else { return self }
        
        let middleIndex = self.count / 2
        
        let leftArray = Array(self[0..<middleIndex]).mergeSort()
        
        let rightArray = Array(self[middleIndex..<self.count]).mergeSort()
        
        return self.merge(leftArray, and: rightArray)
    }
    
    
}


var array = [1,3,2,5,4]

array.mergeSort()
array.sort(by: >)


