var AjaxUtil = function(p_url, p_params, p_method,p_aSync){ // 익명함수 : 이름이 없는 함수
	if(!p_url || p_url.trim()==""){
		alert("AjaxUtil호출시 url은 필수 입니다.");
		return;
	}
	this.params = p_params;
	var getHttpXmlObj = function(){
		if(window.XMLHttpRequest){
	  		return new XMLHttpRequest();
	 	}else if(window.ActiveXObject){
	  		return new ActiveXObject("Microsoft.XMLHTTP");
	 	}
		alert("해당 브라우져가  Ajax를 지원하지 않습니다.");
	}
	this.xhr = getHttpXmlObj(); // getHttpXmlObj 중요!
	var method = p_method?p_method:"get";
	var url = p_url;
	var aSync = p_aSync?p_aSync:true;
	this.xhr.callback = null;
	this.xhr.onreadystatechange=function(){
   		if (this.readyState==4){
   			if(this.status==200){ // request,response 성공, 200번대 아니면 모두 에러.
	   			var result = decodeURIComponent(this.responseText);
	   			if(this.callback){
	   				this.callback(result);
	   			}else{
	   				alert(result);
	   			}
   			}else{ // 실패
	   			var result = decodeURIComponent(this.responseText);
	   			alert(result);
   			}
   		}
	}
	this.changeCallBack = function(func){
		this.xhr.callback = func;
	}
   	this.xhr.open(method, url+this.params, aSync);
   	this.send = function(){
   		this.xhr.send.arguments = this;
   	   	this.xhr.send();
   	}
}