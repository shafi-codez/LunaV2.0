/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

//function to fix height of iframe!
var calcHeight = function() {
    var headerDimensions = $('#header-bar').height();
    $('#preview-frame').height($(window).height() - headerDimensions);
}

$(document).ready(function() {
    calcHeight();
    $('#header-bar a.close').mouseover(function() {
        $('#header-bar a.close').addClass('activated');
    }).mouseout(function() {
        $('#header-bar a.close').removeClass('activated');
    });
});

$(window).resize(function() {
    calcHeight();
}).load(function() {
    calcHeight();
});
