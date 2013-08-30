$(function() {

    $('.sortable-questions').sortable({
        stop: function(event, ui) {
            var question_ids = new Array();
            $(this).children().each(function(idx, el) {
                question_ids.push($(this).attr('data-question-id'));
            });
            var category_id = $(this).closest('.quiz-table-category-column').attr('data-category-id');
            $.ajax({
                type: 'put',
                url: '/categories/' + category_id + '/reorder',
                data: {'question_ids': question_ids},
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

});

