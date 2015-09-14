function CommentController(){
  this.view = new CommentView();
}
CommentController.prototype = {
  getNewCommentForm: function(eventTarget){
    var that = this;
    $.ajax($(eventTarget).attr("href")).done(function(newQuestionDiv){
      that.view.renderNewCommentForm({target: eventTarget,newDiv: newQuestionDiv});
    });
  }
};