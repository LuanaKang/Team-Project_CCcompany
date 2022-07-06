function doNotReload(){
    if(    (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
        || (event.keyCode == 116) )
    {
      event.keyCode = 0;
      event.cancelBubble = true;
      event.returnValue = false;
 alert("새로고침 방지");
    }
}
document.onkeydown = doNotReload;


function order(idx, count, id){
	var ordername = document.getElementById('name').value;
	var orderaddress = document.getElementById('address').value;
	var orderemail = document.getElementById('email').value;
	
	var ordercheck = confirm('주문하시겠습니까?');
	if(ordercheck){
		location.href='./ordercomplete.jsp?id='+id+'&idx='+idx+'&count='+count+'&ordername='+ordername+
		'&orderaddress='+orderaddress+'&orderemail='+orderemail;
	}
	else{
		
	}
	
}