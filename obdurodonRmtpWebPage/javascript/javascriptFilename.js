window.onload = function(){
    
    var togglePath = location.pathname
    var togglePath = togglePath.split('.')[0]
    
    if (togglePath.indexOf('Russ') != -1){
        togglePath = togglePath.split('Russ')[0].concat('.xhtml')        
    }
    else {
        togglePath = togglePath.concat('Russ.xhtml')
    }
    
    //Deal with index page by checking for unique situation, and dealing with.
    if (togglePath.indexOf('/.xhtml') != -1){
       togglePath = togglePath.substring(0, togglePath.lastIndexOf('/') + 1);
    }
    var langToggle = document.getElementById('langToggle');
    langToggle.setAttribute('href', togglePath);
}