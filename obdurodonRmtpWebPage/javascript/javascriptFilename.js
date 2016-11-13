window.onload = function(){
    
    var togglePath = location.pathname
    var togglePath = togglePath.split('.')[0]
    
    if (togglePath.indexOf('.edu/shtml') > -1){
        togglePath = togglePath.concat('indexRuss.shtml')
    }
    else if (togglePath.indexOf('Russ') != -1){
        togglePath = togglePath.split('Russ')[0].concat('.shtml')        
    }
    else {
        togglePath = togglePath.concat('Russ.shtml')
    }
    
    //Deal with index page by checking for unique situation, and dealing with.
    if (togglePath.indexOf('/.shtml') != -1){
       togglePath = togglePath.substring(0, togglePath.lastIndexOf('/') + 1);
    }
    var langToggle = document.getElementById('langToggle');
    langToggle.setAttribute('href', togglePath);
}