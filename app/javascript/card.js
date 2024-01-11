const pay = () => {
  const publicKey = document.getElementById('payjp-public-key').dataset.key;
  const payjp = Payjp(publicKey)
}
window.addEventListener("turbo:load", pay);