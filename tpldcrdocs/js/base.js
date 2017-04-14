/* Search */

function getSearchTerm()
{
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == 'q') {
            return sParameterName[1];
        }
    }
}

/* Highlight */
$( document ).ready(function() {
    hljs.initHighlightingOnLoad();
    $('table').addClass('table table-striped table-hover');
});

$('body').scrollspy({
    target: '.scroll-spy',
});

/* Toggle the `clicky` class on the body when clicking links to let us
   retrigger CSS animations. See ../css/base.css for more details. */
$('a').click(function(e) {
    $('body').toggleClass('clicky');
});

/* Prevent disabled links from causing a page reload */
$("li.disabled a").click(function() {
    event.preventDefault();
});

/* Link to github page of current content */
$(document).ready(function(){
    var git = 'https://github.com/decred/dcrdocs/edit/master/docs'
    var t1 = window.location.pathname
    var url = null
    if (t1=='/'){
        url = git + '/index.md'
    }else{
        url = git+t1.substr(0, t1.length-1)+'.md'
    }
    a_git = $('[href="https://github.com/decred/dcrdocs"]')
    a_git.attr('href', url).attr('target', '_blank')
});

window.MathJax = {
    showMathMenu: false,
    imageFont: null
};