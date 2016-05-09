window.onload = function(){
    
    var togglePath = location.pathname.substring(location.pathname.lastIndexOf("/") + 1);
    var togglePath = togglePath.split('.')[0]
    if (togglePath.indexOf('Russ') != -1){
        togglePath = togglePath.split('Russ')[0].concat('.xhtml')
        
    }
    else {
        togglePath = togglePath.concat('Russ.xhtml')
    }
    var langToggle = document.getElementById('langToggle');
    langToggle.setAttribute('href', togglePath);
}