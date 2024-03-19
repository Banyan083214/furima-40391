const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const addProfit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const tax = Math.floor(inputValue * 0.10); // 税金を計算
    addTaxDom.innerHTML = tax; // 税金を表示
    const totalProfit = inputValue - tax; // 販売価格から税金を差し引いた利益を計算
    addProfit.innerHTML = totalProfit; // 利益を表示
  });
};

window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);
