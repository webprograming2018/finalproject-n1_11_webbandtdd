//var myRequest = new XMLHttpRequest();
//	myRequest.open('GET', 'json/products.json');
//	myRequest.overrideMimeType("application/json");
//	myRequest.onload = function(){
//    	var myData = JSON.parse(myRequest.responseText);
//    	addHTML(myData,"Apple");
//	};
////	myRequest.send();	
//
//var counter=0;
//function addHTML(data,Brand){
//    var htmlString = "";
//    for (i=0;i<data.length;i++){
//    if(data[i].brand==Brand){
//        htmlString += '<a href="'+data[i].url+'">'
//        htmlString += '<div class="brandproduct" >';
//        htmlString += '<div class="img">';
//        htmlString += '<img src="'+data[i].imgurl+'">';
//        htmlString += '</div>';
//        htmlString += '<p>'+data[i].name+'</p>';
//        htmlString += '<p class="description">'+data[i].brand+' | '+data[i].release+' | '+data[i].price+' tr</p>';
//        htmlString += '</div>';
//        htmlString += '</a>';
//        counter++;
//        if(counter==4){
//            break;
//        }
//        }
//    }
//    document.getElementById(Brand).insertAdjacentHTML('beforeend',htmlString);
//}

//Inf scroll

//$(window).scroll(function() {
//    var height = $(document).height() - 850;
//    var  scroll = $(window).scrollTop();
//    var isScrolledToEnd = (scroll >= height);
//   if( isScrolledToEnd ) {
//       var additionalContent = GetMoreContent();
//       $('.products').append(additionalContent);
//   }
//});
//
//
//function GetMoreContent() { 
//        myData = JSON.parse(myRequest.responseText);
//        moreHTML(myData,"Apple");
//}
//
//function moreHTML(data,Brand){
//    var htmlString = "";
//    var ioscountmore=0;
//    for (i=counter;i<data.length;i++){
//    if(data[i].brand==Brand){
//        htmlString += '<a href="'+data[i].url+'">'
//        htmlString += '<div class="brandproduct" >';
//        htmlString += '<div>';
//        htmlString += '<img src="'+data[i].imgurl+'">';
//        htmlString += '</div>';
//        htmlString += '<p>'+data[i].name+'</p>';
//        htmlString += '<p class="description">'+data[i].brand+' | '+data[i].release+' | '+data[i].price+' tr</p>';
//        htmlString += '</div>';
//        htmlString += '</a>';
//        counter++;
//        ioscountmore++;
//        if(ioscountmore==4){
//            break;
//        }
//    }
//    }
//    document.getElementById(Brand).insertAdjacentHTML('beforeend',htmlString);
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