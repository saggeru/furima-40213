function price_calc() {
  const priceInput = document.getElementById("item-price")

  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    addTaxPrice.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue - inputValue % 10);
  })
}

window.addEventListener('turbo:load', price_calc)
window.addEventListener('turbo:render', price_calc)