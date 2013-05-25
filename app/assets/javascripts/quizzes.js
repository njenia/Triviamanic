function addToCategory(quiz_id, question_id) {
    category = $('#category_tabs .active a').text();
    if (category) {
        $.post('/quizzes/' + quiz_id + '/quiz_questions', {'category_name' : category, 'question_id' : question_id});
    }
}