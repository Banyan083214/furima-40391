const pay = () => {
  const button = document.getElementById('button'); // ボタンのIDを指定する
  button.addEventListener("click", (e) => {
    console.log("ボタンクリック時にイベント発火");
    e.preventDefault(); // ボタンのデフォルト動作をキャンセルする
  });

  const numberForm = document.getElementById('number-form'); // カード情報入力フォームのDOMを取得
  const expiryForm = document.getElementById('expiry-form'); // 有効期限入力フォームのDOMを取得
  const cvcForm = document.getElementById('cvc-form'); // セキュリティコード入力フォームのDOMを取得

  numberForm.addEventListener('input', () => {
    console.log('カード番号が入力されました');
  });

  expiryForm.addEventListener('input', () => {
    console.log('有効期限が入力されました');
  });

  cvcForm.addEventListener('input', () => {
    console.log('セキュリティコードが入力されました');
  });
};

window.addEventListener("turbo:load", pay);
