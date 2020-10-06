window.addEventListener('load', function(){
  let price_input = document.getElementById("item-price").value
  let addTaxPrice = document.getElementById("add-tax-price")
  let profit = document.getElementById("profit")

  let fee =  price_input * 0.1
  fee     = Math.floor(fee)
  let sales_profit = price_input - fee
  sales_profit     = Math.ceil(sales_profit)

  addTaxPrice.innerHTML = fee
  profit.innerHTML = sales_profit

  document.addEventListener('input', function(){
    let price_input = document.getElementById("item-price").value
    let addTaxPrice = document.getElementById("add-tax-price")
    let profit = document.getElementById("profit")

    let fee =  price_input * 0.1
    fee     = Math.floor(fee)
    let sales_profit = price_input - fee
    sales_profit     = Math.ceil(sales_profit)
 
    addTaxPrice.innerHTML = fee
    profit.innerHTML = sales_profit

  })

})

