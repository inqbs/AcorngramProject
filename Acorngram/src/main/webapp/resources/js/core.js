function toggleWritePopup(){document.querySelector(".writepost").classList.toggle("is-visible")}function confirmAccess(e){window.confirm("정말로 하시겠습니까?")&&(location.href=e)}function likeControl(e){var t=document.querySelector(".post-"+e+" .post__like a"),o=t.classList.contains("liked")?"unlike":"like";fetch("post/"+o+".do?num="+e).then(function(e){return e.json()}).then(function(e){if(e.result)switch(o){case"unlike":t.querySelector("i").classList.replace("glyphicon-heart","glyphicon-heart-empty"),t.classList.remove("liked");break;case"like":t.querySelector("i").classList.replace("glyphicon-heart-empty","glyphicon-heart"),t.classList.add("liked")}}).catch(function(e){window.alert("서버와 통신 도중 에러가 발생했습니다.")})}function deletePost(t){window.confirm("정말로 삭제하시겠습니까?")&&fetch("post/delete.do?num="+t).then(function(e){return e.json()}).then(function(e){e.result?(window.alert("성공적으로 삭제되었습니다."),$(".post-"+t).fadeOut(300,function(){$(this).remove()})):window.alert("오류가 발생했습니다.")}).catch(function(e){window.alert("서버와 통신 도중 에러가 발생했습니다.")})}function followToggle(e){if(followAjax("follwer/follow.do",e)){window.alert("성공적으로 팔로우되었습니다.");var t=document.querySelector("post-"+e+' a[class*="follow]');t.classList.replace("post__btn-follow","post__btn-unfollow"),t.querySelector("i.glyphicon").classList.replace("glyphicon-plus-sign","glyphicon-remove-sign"),t.querySelector("span").innerText="Unfollow"}else window.alert("오류가 발생했습니다.")}function unfollowToggle(e){if(followAjax("follwer/unfollow.do",e)){window.alert("성공적으로 언팔로우되었습니다.");var t=document.querySelector("post-"+e+' a[class*="follow]');t.classList.replace("post__btn-unfollow","post__btn-follow"),t.querySelector("i.glyphicon").classList.replace("glyphicon-remove-sign","glyphicon-plus-sign"),t.querySelector("span").innerText="Follow"}else window.alert("오류가 발생했습니다.")}function followAjax(e,t){return fetch(e+"?usercode="+t).then(function(e){return e.json()}).then(function(e){return e.result}).catch(function(e){return!1})}var test;moment.locale("ko"),document.querySelectorAll("time").forEach(function(e){var t=moment().utc(e.dateTime);e.innerText=t}),$(".post__btn-like").on("hover",function(){console.dir($(this).children(".glyphicon")),$(this).children(".glyphicon").toggleClass("glyphicon-heart").toggleClass("glyphicon-heart-empty")}),$(".post").on("click",function(e){var t=$(this).attr("id").replace(/\D/g,"");e.target.className.match(/img/)&&(location.href="post/detail.do?num="+t)}),$(".writepost__img").on("change",function(e){var t=new FileReader;t.onload=function(e){$("#preview").attr("src",e.target.result)},t.readAsDataURL(e.target.files[0])});var makeCover=function(){var e=document.createElement("div");return e.className="cover",e.onclick=function(){e.remove()},e},toggle={run:function(e,t,o){return e&&e.addEventListener("click",function(){if(t.classList.toggle("is-active"),o){var e=makeCover();e.addEventListener("click",function(){t.classList.remove("is-active")}),t.classList.contains("is-active")?document.body.insertBefore(e,document.querySelector("main")):document.querySelector(".cover").remove()}}),this}};toggle.run(document.querySelector(".header__user-info"),document.querySelector("nav.user-menu"),!0).run(document.querySelector('[class*="writepost"] button'),document.querySelector(".writepost"),!1);
