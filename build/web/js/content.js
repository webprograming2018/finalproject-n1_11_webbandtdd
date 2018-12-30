//	var myRequest = new XMLHttpRequest();
//	myRequest.open('GET', 'json/products.json');
//	myRequest.overrideMimeType("application/json");
//	myRequest.onload = function(){
//    	var myData = JSON.parse(myRequest.responseText);
//    	headHTML(myData,"HOT",1,2,3,4);
//    	headHTML(myData,"SALE",10,20,30,40);
//    	addHTML(myData,"Apple");
//    	addHTML(myData,"Samsung");
//    	addHTML(myData,"Oppo");
//    	addHTML(myData,"Nokia");
//    	addHTML(myData,"Huawei");
//    	addHTML(myData,"Sony");
//    	window.myData = myData;
//	};
//	myRequest.send();	

//function headHTML(data,h,a,b,c,d){
//	var htmlString = "";
//
//	for (i=0;i<data.length;i++){
//		if(i==a||i==b||i==c||i==d){
//		htmlString += '<a href="'+data[i].url+'">'
//		htmlString += '<div class="product">';
//		htmlString += '<div class="img">';
//		htmlString += '<img src="'+data[i].imgurl+'">';
//		htmlString += '</div>';
//		
//		htmlString += '<p>'+data[i].name+'</p>'; 
//		
//		htmlString += '<p class="description">'+data[i].brand+' | '+data[i].release+' | '+data[i].price+' tr</p>';
//		htmlString += '</div>';
//		htmlString += '</a>';
//		}
//	}
//	document.getElementById(h).insertAdjacentHTML('beforeend',htmlString);
//};

//
//function addHTML(data,a){
//	var htmlString = "";
//	for (i=0;i<data.length;i++){
//	if(data[i].brand==a){
//		htmlString += '<a href="'+data[i].url+'">'
//		htmlString += '<div class="product" >';
//		htmlString += '<div class="img">';
//		htmlString += '<img src="'+data[i].imgurl+'">';
//		htmlString += '</div>';
//		htmlString += '<p>'+data[i].name+'</p>';
//		htmlString += '<p class="description">'+data[i].brand+' | '+data[i].release+' | '+data[i].price+' tr</p>';
//		htmlString += '</div>';
//    htmlString += '</a>';
//		}
//	}
//	document.getElementById(a).insertAdjacentHTML('beforeend',htmlString);
//}

function All(data,Brand) {
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortAZ(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.name.toLowerCase();
      var textB = b.name.toLowerCase();

      return textA.localeCompare(textB);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortZA(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.name.toLowerCase();
      var textB = b.name.toLowerCase();

      return textB.localeCompare(textA);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortreleseinc(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.release;
      var textB = b.release;

      return (textA-textB);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortrelesedec(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.release;
      var textB = b.release;

      return (textB-textA);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortpriceinc(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.price;
      var textB = b.price;

      return (textA-textB);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function sortpricedec(data,Brand) {
    data.sort(function (a, b) {
      var textA = a.price;
      var textB = b.price;

      return (textB-textA);
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(data,Brand);
}
function filyear(data,Brand,Value) {
    var newdata = [''];
    newdata = data.filter(function(a){
        return a.release==Value;
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(newdata,Brand);
}

function filyearmore(data,Brand,Value) {
    var newdata = [''];
    newdata = data.filter(function(a){
        return a.release>=Value;
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(newdata,Brand);
}
function filyearless(data,Brand,Value) {
    var newdata = [''];
    newdata = data.filter(function(a){
        return a.release<Value;
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(newdata,Brand);
}
function filpricemore(data,Brand,Value) {
    var newdata = [''];
    newdata = data.filter(function(a){
        return a.price>=Value;
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(newdata,Brand);
}
function filpriceless(data,Brand,Value) {
    var newdata = [''];
    newdata = data.filter(function(a){
        return a.price<Value;
    });
    document.getElementById(Brand).innerHTML = " ";
    addHTML(newdata,Brand);
}

// window.onload=drag();
// function drag(){
// $('.block').draggable({
// 	containment: '.wrap',
// 	cursor: 'move',
// 	snap: 'true',
// 	stack: 'true'
// 	});
// }


