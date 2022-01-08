function tax (){
    const priceInput = document.getElementById("item-price");
    if (!priceInput){ return false;}
    priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      const addTaxDom = document.getElementById("add-tax-price");
      const addProfit = document.getElementById("profit");
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      addProfit.innerHTML = inputValue - Math.floor(inputValue * 0.1);
    });
  }
window.addEventListener('load', tax);