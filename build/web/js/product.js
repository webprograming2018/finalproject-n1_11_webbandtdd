//	var myRequest = new XMLHttpRequest();
//	myRequest.open('GET', 'json/products.json');
//	myRequest.overrideMimeType("application/json");
//	myRequest.onload = function(){
//    	var myData = JSON.parse(myRequest.responseText);
//    	productHTML(myData);
//	};
//	myRequest.send();
//
//var productContainer = document.getElementById("proDuct");
//function productHTML(data){
//	var htmlString = "";
//	var	i=0;
//        
//		htmlString += '<img src="'+data[i].imgurl+'">';
//		htmlString += '<div class="productdes">';
//		htmlString += '<h1>'+data[i].name+'</h3>'; 
//		htmlString += '<h3> Hãng: '+data[i].brand+'</h5>';
//		htmlString += '<h3> Năm phát hành: '+data[i].release+' </h5> ';
//		htmlString += '<h2> Giá: '+data[i].price+' triệu đồng</h3>';
//		htmlString += '<button class="Buybtn">Add to cart</button>';
//		htmlString += '</div>';
//	productContainer.insertAdjacentHTML('beforeend',htmlString);
//};
function openDes(desName) {
    var i;
    var x = document.getElementsByClassName("product-body");
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none"; 
    }
    document.getElementById(desName).style.display = "block"; 
}