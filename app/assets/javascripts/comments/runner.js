$(document).ready(function(){
  var ctrl = new CommentController();
  $(document).on("click", ".add_comment", function(event){
    event.preventDefault();
    ctrl.getNewCommentForm(event.target);
  });
  $(document).on("submit", ".comment_form", function(event){
    event.preventDefault();
    ctrl.saveComment(event.target);
  });
});