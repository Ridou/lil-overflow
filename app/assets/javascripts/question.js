$(document).ready(function(){
  $(".question_form").children().on("click", function(event){
    event.preventDefault();
      $.ajax({
      }).done(function(){
        console.log();
        $('.new_question_form').show();
      });
  });
// create a new question
  $(".new_question").on("submit", function(event){
	event.preventDefault();
		$.ajax({
			url: '/questions',
			type: 'POST',
			dataType: 'HTML',
			data: $('form').serialize(),
		})
		.done(function(response) {
			$('tbody').append(response);
			console.log("success");
			})
		.always(function() {
			console.log("complete");
		});
  });
  $('.delete_que').on("click", function(event){
		var item = $(event.target).attr('data-title');
		var ele = $(event.target).closest('tr');
			if (confirm('Are you sure you want to delete '+item)) {
			ele.remove();
		}
  });
});
