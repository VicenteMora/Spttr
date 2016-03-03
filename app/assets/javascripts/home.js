// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
    //  $('body').on('click', function(event) {
    //     console.log(event)
    //     if (!$(event.target.parentElement).hasClass('switch') || $(event.target).hasClass('switch')) {
    //         $('.collapsable').removeClass('open');
    //     }
    // })
    $('.navbar-nav [data-toggle="tooltip"]').tooltip();
    $('.navbar-twitch-toggle').on('click', function(event) {
        event.preventDefault();
        $('.navbar-twitch').addClass('open');
    });
     $('.navbar-twitch-toggle2').on('click', function(event) {
        event.preventDefault();
        $('.navbar-twitch2').addClass('open');
    });
    
    $('.nav-style-toggle').on('click', function(event) {
        event.preventDefault();
        var $current = $('.nav-style-toggle.disabled');
        $(this).addClass('disabled');
        $current.removeClass('disabled');
        $('.navbar-twitch').removeClass('navbar-'+$current.data('type'));
        $('.navbar-twitch').addClass('navbar-'+$(this).data('type'));
    });
});