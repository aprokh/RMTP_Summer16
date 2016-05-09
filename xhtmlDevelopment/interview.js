/*
 -Changes: 
 -Capitalize the first letter of the stuff on the right. DONE
 -Do the comparison thing? NOT DONE
 -Change from adding in-line attributes to do eventlisteners. NOT DONE
 -Edit so that do not re-declare spans all the time, because the window.spans works as global. DONE 
 -Can potentially make previous and current highlighted (main has big highlight, secondary has slightly differen) PROBABLY NOT DOING
 -Add in a function to clear all span colors when clicking one of the radios DONE 
 -Could potentially make the scrolling thing more robust by saying only let it focus on scrolling in this div if there is overflow possibly.
 -Edit the XSLT to a) create the three panels b) give basic stuff that we're missing in example javascript
  
 
 
 */

window.spans = document.getElementsByTagName('span');
window.onload = function(){
    //setBoxes();
    setRadios();
    //Set up the #rightPanel scrolling thing to eliminate that issue
    var rightPanel = document.querySelectorAll('#rightPanel');
    rightPanel[0].setAttribute('onmouseover', 'document.body.style.overflow="hidden"');
    rightPanel[0].setAttribute('onmouseout', 'document.body.style.overflow="auto"');
}

function setBoxes(){
    var container = document.getElementById('boxes')
    var classes = []

    for (var i = 0; i < spans.length; i++){
        var thisClass = spans[i].getAttribute('class')
        if (classes.indexOf(thisClass) == -1){
           classes.push(thisClass)
           }
    }
    
    for (var i = 0; i < classes.length; i++){
        var newLabel = document.createElement("label");
        var newText = document.createTextNode(classes[i])
        newLabel.appendChild(newText);
        newLabel.setAttribute('for', classes[i])
        var newBox = document.createElement("input");
        newBox.type = "radio";
        newBox.id = classes[i]
        newBox.name = 'selector'
        newBox.setAttribute('onclick', 'highlight("'.concat(classes[i], '")'));
        container.appendChild(newLabel)
        container.appendChild(newBox)
    }
}

function setRadios(){
    var radios = document.querySelectorAll('input');
    var labels = document.querySelectorAll('label');
    for (var i = 0; i < radios.length; i++){
        var id = radios[i].getAttribute('id');
        radios[i].setAttribute('onclick', 'highlight("'.concat(id, '")'));       
    }
    
}

function highlight(highlightClass) {
    clearSpans();
    clearRight();
    var spans = document.getElementsByClassName(highlightClass);
    createList(spans)
    var rightPanel = document.getElementById('rightPanel');
    for (var i = 0; i < spans.length; i++){
        spans[i].setAttribute('style', 'color:red');
        spans[i].id = 'target'.concat(i);
        var newP = document.createElement('p');
        var newA = document.createElement('a');
        var pText = document.createTextNode(capitalize(spans[i].innerText));
        newA.appendChild(pText);
        newA.href = '#target'.concat(i);
        newP.appendChild(newA);
        newP.appendChild(newA)
        rightPanel.appendChild(newP);
    }
}

function clearRight(){
     var rightDiv = document.getElementById('rightPanel');
     while (rightDiv.hasChildNodes()){
        rightDiv.removeChild(rightDiv.childNodes[0]);
     }
    
  //   var spans = document.querySelectorAll('span'); 
     for (var i = 0; i < spans.length; i++){
         spans[i].removeAttribute('id')
     }
}

function clearSpans(){
    
 //   var spans = document.querySelectorAll('span');
    for (var i = 0; i < spans.length; i ++){
        spans[i].removeAttribute('style');
    }
    
}

function capitalize(str){
        return str.substring(0,1).toUpperCase() + str.slice(1); 
}

/*With this, want to take a list of various spans. For each one, create a list of distinct spans.
 * From these distinct spans, get counts. Then I can go through both arrays at once to do what I want.
 * 
 * Currently works to get distinct strings, ignoring capitalization and trimming whitespace.
 */
function createList(allSpans){
    var distinctSpans = [];
    for (var i = 0; i < allSpans.length; i++){
        var thisSpan = capitalize(allSpans[i].innerText.trim())
        if (distinctSpans.indexOf(thisSpan) == -1){
           distinctSpans.push(thisSpan)
           console.log(thisSpan)
           }
    }
    
    
}

