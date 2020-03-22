var receiverAddressObj;
var receiverNameObj;
var receiverPhoneObj;

window.onload = function() {	// 页面加载之后, 获取页面中的对象
	receiverAddressObj = document.getElementById("receiverAddress");
	receiverNameObj = document.getElementById("receiverName");
	receiverPhoneObj = document.getElementById("receiverPhone");
};

function checkOnSubmit() {// 验证整个表单
/*	setCookie("haha",document.getElementById("sum_grade").value(),"");
	console.log(document.getElementById("sum_grade").value());*/
	var receiverAddress = checkReceiverAddress();
	var receiverName = checkReceiverName();
	var receiverPhone = checkReceiverPhone();
	console.log("receiverName :" + receiverName);
	alert("receiverName :" + receiverName);
	if(receiverAddress && receiverName && receiverPhone){
		document.getElementById("orderForm").submit();
	}else{
	   return "";
	}

}

function checkReceiverAddress() {			// 验证收获地址
	var value =receiverAddressObj.value;
	var msg = "";
	if (!value)
		msg = "请输入收货地址！";	
	receiverAddressMsg.innerHTML = msg;
	receiverAddressObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkReceiverName() {		// 验证收货人
	var value =receiverNameObj.value;
	var msg = "";
	if (!value)
		msg = "请输入收货人！";	
	receiverNameMsg.innerHTML = msg;
	receiverNameObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}

function checkReceiverPhone() {		// 验证联系方式
	var regex =/^1[3|4|5|7|8][0-9]{9}$/;	//以13、15、18开头的手机号/^1[3,5,8]\d{9}$/
	var value =receiverPhoneObj.value;
	var msg = "";
	if (!value)
		msg = "请输入手机号！";
	else if (!regex.test(value))
		msg = "请输入正确的手机号码！";
	receiverPhoneMsg.innerHTML = msg;
	receiverPhoneObj.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	return msg == "";
}
