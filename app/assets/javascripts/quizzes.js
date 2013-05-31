function addToCategory(question_id) {
    // Each category tab has it's id in the id attribute as 'category42'
    category_id = $('#categories_tab_content .active').attr('id').substr(9);
    if (category_id) {
        $.post('/categories/' + category_id + '/quiz_questions', {'question_id':question_id});
    }
}

function removeQuestionFromCategory(quiz_question_id) {
    $.ajax({
        url:'/quiz_questions/' + quiz_question_id,
        type:'DELETE'
    });
}