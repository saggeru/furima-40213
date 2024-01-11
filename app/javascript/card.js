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

};

window.addEventListener("turbo:load", pay);