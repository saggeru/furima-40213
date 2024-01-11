const pay = () => {
  const publicKey = document.getElementById('payjp-public-key').dataset.key;
  const payjp = Payjp(publicKey)
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber'); /* ▼ 入力フォームの生成 ▼ */
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc'); /* ▲ ('引数')にはフォームのタイプ ▲ */

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form'); /* ▼▲ 生成したフォームをビューファイルに描画していく ▲▼ */
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form') /* ■ フォームを取得(=送信ボタンを押したときの保存先を取得) */
  form.addEventListener("submit", (e) => {
    payjp.createToken(numberElement).then(function (response) { /* ■ Payjpインスタンス createTokenでtokenを取得 ■ */
      if (response.error) { /* ■ トークンが正常に生成されたか。 生成された場合はresponse.idが戻り値 ■ */
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`; /* ■ token = response.id なおtokenはユーザーに見せる必要がないため'hidden'を指定 ■ */
        renderDom.insertAdjacentHTML("beforeend", tokenObj); /* ■ フォームの直後にtokenを設置 ■ */
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      document.getElementById("charge-form").submit(); /* ■ カードの情報は上記で空。submit→サーバーサイドへ送られるのはtokenのみ ■ */
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);