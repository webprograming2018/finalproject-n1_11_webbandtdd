/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var input_search = document.getElementsByClassName("input_search");
var suggestion_search = document.getElementsByClassName("suggestion_search")[0];
var btn_search = document.getElementsByClassName("btn_search");


//btn
btn_search[0].addEventListener("click",function(){
    if(input_search[0].value!==""){
        window.location.href='./searchs.jsp';
    }
    suggestion_search.style.display ="none";
});

//input
input_search[0].addEventListener("keyup",function(e){
    if(input_search[0].value.length!==0&&e.keyCode!==13){
        suggestion_search.style.display ="block";  
        postToSearchServlet(input_search[0].value)
    }else{
        input_search[0].value="";
        suggestion_search.style.display ="none";
    }
});

function postToSearchServlet(inputText){
    var xhr = new XMLHttpRequest();
    xhr.open("POST", './SearchServelet?search="'+inputText+'"', true); 
    
    xhr.onreadystatechange = function() { 
        if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
            console.log(xhr.responseText.toString());
            if(xhr.responseText!==[]){
                var dataSearch = JSON.parse(xhr.responseText);
                if(dataSearch.length!=0){
                    var textSuggest="";
                    var i=0;
                    for(let data of dataSearch){
                        textSuggest+="<div class=\"item_suggest\"> <a href=\"./single.jsp?productID="+data.productID+"\">"+data.productName+"</a></div>";
                        i++;
                        if(i==8){
                            break;
                        }
                    }
                    suggestion_search.innerHTML=textSuggest;
                }else{
                    suggestion_search.style.display ="none";
                }
            }
        }
    };
    xhr.send();   
}
