document.addEventListener("turbolinks:load", function(){
  if (document.getElementById("button") != null) {
    Payjp.setPublicKey('pk_test_f101f21e27dffb8a6708eed3');
    let submit = document.getElementById("button");
    submit.addEventListener('click', function(e){
      e.preventDefault();
      let card = {
          number: document.getElementById("payment_card_number").value,
          cvc: document.getElementById("payment_card_cvc").value,
          exp_month: document.getElementById("payment_card_month").value,
          exp_year: document.getElementById("payment_card_year").value
      };
      Payjp.createToken(card, function(status, response) {
        if (status === 200) {
          $(".number").removeAttr("name");
          $(".cvc").removeAttr("name");
          $(".exp_month").removeAttr("name");
          $(".exp_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp_token">').val(response.id)
          );
          document.inputForm.submit();
          alert("登録が完了しました");
        } else {
          alert("カード情報が正しくありません。");
        }
      });
    });
  } 
});