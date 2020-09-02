//function関数名なのでcheckは関数名
function check() {
  const posts = document.querySelectorAll(".post");//クラス名で指定。index.html.erbの中
  posts.forEach(function (post) { //.postで取ってきた値はメモの数だけあるからforEachを使う。
    if (post.getAttribute("data-load") != null) {
      return null;
    }
    post.setAttribute("data-load", "true");
    post.addEventListener("click", () => {  //クリックというイベントがあった時に下の処理が発動することを示している。
      const postId = post.getAttribute("data-id");  //getAttributeは属性名で指定する。data-idという属性名を指定。
      const XHR = new XMLHttpRequest();//使えるようにして、、、
      XHR.open("GET", `/posts/${postId}`, true);//openでどのようなリクエストをするか指定
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.post;//XHR.responseでレスポンスされてきたJSONにアクセス
        if (item.checked === true) {//itemをチェックして既読であればtrueを返し、
          post.setAttribute("data-check", "true");
        } else if (item.checked === false) {//itemをチェックしfalseであれば
          post.removeAttribute("data-check");//data-checkを属性ごと削除
        }
      };
     });
  });
}
setInterval(check, 1000);