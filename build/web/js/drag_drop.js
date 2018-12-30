// console.log('hihi');
const fills = document.querySelectorAll('.fill');
const empties = document.querySelectorAll('.block');

//fill listeners
// for(const fill of fills){
//     fill.addEventListener('dragstart',dragStart);
//     fill.addEventListener('dragend',dragEnd);
// }



//loop through empties and call drag events
for(const empty of empties){
    empty.addEventListener('dragover',dragOver);
    empty.addEventListener('dragenter',dragEnter);
    empty.addEventListener('dragleave',dragLeave);
    empty.addEventListener('drop',dragDrop);
}


//drag function
function dragStart(e){
    e.dataTransfer.clearData();
    e.dataTransfer.setData("text", e.target.id);
    // e.preventDefault();
    // setTimeout(()=>this.className = ' invisible',0);
}

function dragEnd(e){
    e.preventDefault();
    // console.log(this);
}

function dragOver(e){
    e.preventDefault();
    // this.className = 'fill';
    // console.log('drag over')
}

function dragEnter(e){
    e.preventDefault();
    // this.className += ' hovered'; 
    // console.log('drag enter')
}

function dragLeave(e){
    e.preventDefault();
    // this.className = 'empty';
    // console.log('drag leave')
}

function dragDrop(e){
    // console.log('drag drop');
    // this.className = 'empty';
    if(e.preventDefault) {e.preventDefault()}
    const bien = e.dataTransfer.getData("text");
    if(bien!==""){
        const temp = document.getElementById(bien);
        const parent = temp.parentNode;
        const data = this.innerHTML;

        parent.innerHTML = data;
        this.innerHTML='';
        this.appendChild(temp);
        console.log(data);
        console.log(e);
    }else{
        console.error(e);
    }
    
    
}
