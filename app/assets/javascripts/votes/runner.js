$(document).ready(function(){
  var ctrl = new VoteController();
  $(document).on("submit", ".upvote_question", function(event){
    event.preventDefault();
    ctrl.upvoteQuestion(event.target);
  });
  $(document).on("submit", ".downvote_question", function(event){
    event.preventDefault();
    ctrl.downvoteQuestion(event.target);
  });
  $(document).on("submit", ".upvote_answer", function(event){
    event.preventDefault();
    ctrl.upvoteAnswer(event.target);
  });
  $(document).on("submit", ".downvote_answer", function(event){
    event.preventDefault();
    ctrl.downvoteAnswer(event.target);
  });
});
