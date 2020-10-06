window.addEventListener('load', function(){
  let price_input1 = document.getElementById("item-price").value
  let addTaxPrice1 = document.getElementById("add-tax-price")
  let profit1 = document.getElementById("profit")

  let fee1 =  price_input1 * 0.1
      fee1 = Math.floor(fee1)
  let sales_profit1 = price_input1 - fee1
      sales_profit1 = Math.ceil(sales_profit1)
      addTaxPrice1.innerHTML = fee1
      profit1.innerHTML = sales_profit1
  
  document.addEventListener('input', function(){
    let price_input = document.getElementById("item-price").value
    let addTaxPrice = document.getElementById("add-tax-price")
    let profit = document.getElementById("profit")

    let fee =  price_input * 0.1
        fee = Math.floor(fee)
    let sales_profit = price_input - fee
        sales_profit = Math.ceil(sales_profit)
 
    addTaxPrice.innerHTML = fee
    profit.innerHTML = sales_profit

  })

})

