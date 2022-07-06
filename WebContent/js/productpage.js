var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}


function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

function order(id, idx, img) {
	var ordercheck = confirm('해당 상품을 주문하시겠습니까?');
	if(ordercheck){
		var count= document.getElementById('amount').value;
		location.href='orderform.jsp?index='+idx+'&id='+id+'&count='+count+'&img='+img;
	}
	else{}
}

function cartgo(id, idx,img, gup) {
	var count= document.getElementById('amount').value;
	console.log('count='+count);
	console.log('img='+img);
	console.log('gup='+gup);
	location.href='cartadd.jsp?idx='+idx+'&id='+id+'&count='+count+'&img='+img+'&gup='+gup;
}
function already(){
	var gocart = confirm('이미 장바구니에 존재하는 상품입니다.\n 장바구니로 이동하시겠습니까?');
	if(gocart){
		location.href = 'cart.jsp'
	}
	
}

/*"location.href='orderform.jsp?idx=<%=idx%>&id=<%=id%>'"*/
