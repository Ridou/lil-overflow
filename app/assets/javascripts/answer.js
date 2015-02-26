$(document).ready(function(){
  $(".answer_form").children().on("click", function(event){
    event.preventDefault();
      $.ajax({
      }).done(function(){
        console.log();
        $('.new_answer_form').show();
      });
  });
// create a new answer
  $(".new_answer").on("submit", function(event){
  event.preventDefault();
  var question_id = parseInt($('.answer_form')
    .children().attr('href').match(/\d/));
    $.ajax({
      url: "/questions/"+question_id+"/answers",
      type: 'POST',
      dataType: 'HTML',
      data: $('form').serialize(),
    })
    .done(function(response) {
      $('tbody').append(response);
      console.log("success");
      });
  });
  // delete
  $('.delete_ans').on("click", function(event){
    var item = $(event.target).attr('data-title');
    console.log(item);
    var ele = $(event.target).closest('tr');
      if (confirm('Are you sure you want to delete '+item)) {
      ele.remove();
    }
  });
});
