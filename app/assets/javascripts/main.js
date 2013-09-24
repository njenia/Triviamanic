$(function() {
    $('#bootcamp-notice-close-button').click(function(event) {
        $.ajax({
            method: 'put',
            url: 'cancel_bootcamp_notice'
        }).success(function() {
            $('#bootcamp-notice-container').remove();
        });
    })
})

