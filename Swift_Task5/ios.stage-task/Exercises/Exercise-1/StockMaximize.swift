import Foundation

class StockMaximize {
    
    func countProfit(prices: [Int]) -> Int {
        if (prices.isEmpty || prices.count == 1) { return 0 }
        var arr = prices
        arr.append(0)
        var result = 0
        result = toDo(prices: &arr, count: arr.count - 1)
        return result
    }
    
    
    func toDo(prices: inout [Int], count: Int) -> Int {
        var max = 0
        var end = 0
        var n = 0
        var m = 0
        for val in prices
        {
            if (n < count && val >= 0)
            {
                max = val
                while (val <= prices[n + m] && max <= prices[n + m])
                {
                    max = prices[n + m]
                    m += 1
                }
                end += max - val
            }
            n += 1;
            m = 0;
        }
        return end
    }
}
