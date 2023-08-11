window.addEventListener('load', function(){
  
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitAmount = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const price = priceInput.value;
    const tax = Math.floor(price * 0.1);
    const profit = price - tax;
    addTaxDom.innerHTML = tax;
    profitAmount.innerHTML = profit;
  })
})