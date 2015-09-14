function CommentView(){

}
CommentView.prototype = {
  renderNewCommentForm: function(args){
    var targetParent = $(args.target).parent();
    $(args.newDiv).insertAfter(targetParent);
  }
};