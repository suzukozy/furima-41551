function list() {
  const itemPrice = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  itemPrice.addEventListener('input', () => {
    const price = parseInt(itemPrice.value);
    const commission = Math.floor(price * 0.1);
    addTaxPrice.textContent = commission;
    const salesProfit = price - commission;
    profit.textContent = salesProfit;
  });
}

window.addEventListener('turbo:load', list);
window.addEventListener('turbo:render', list);