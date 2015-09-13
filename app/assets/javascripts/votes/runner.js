$(document).ready(function(){
  var ctrl = new Controller();
  $(document).on("submit", ".upvote_question", function(event){
    event.preventDefault();
    ctrl.upvoteQuestion(event.target);
  });

  $(document).on("submit", ".downvote_question", function(event){
    event.preventDefault();
    ctrl.downvoteQuestion(event.target);
  });


});
