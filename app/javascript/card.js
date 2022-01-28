const pay = () => {
  Payjp.setPublicKey("pk_test_4925b6f2d84013d5c1c3e8d8");
  const submit = document.getElementById("button")
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new formData(formResult);

    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200){
        const token = response.id;
        console.log(token)
      }
    });
  });
};

window.addEventListener("load", pay);