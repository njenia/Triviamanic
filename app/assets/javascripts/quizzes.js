$(function() {

    $('.sortable-questions').sortable({
        stop: function(event, ui) {
            /*var question_ids = new Array();
            $(this).children().each(function(idx, el) {
                question_ids.push($(this).attr('data-question-id'));
            });*/
            var category_id = $(this).closest('.quiz-table-category-column').attr('data-category-id');
            $.ajax({
                type: 'get',
                url: '/categories/' + category_id + '/reorder',
                success: function() {
                    var points = 0;
                    $('div[data-category-id="' + category_id + '"] .question-points').html(function() {
                        points += 100;
                        return points;
                    });
                }
            });
        }
    });

    $('#category-form').submit(function() {
       if ($('#new-category-name')[0].value == '') {
           alert('Please specify category name');
           return false;
       }
    });

});

