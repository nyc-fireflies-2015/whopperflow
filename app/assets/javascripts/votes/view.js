VoteView = function(){

};
VoteView.prototype = {
  getVoteParent: function(eventTarget){
    return $(document).find(eventTarget).closest(".vote");
  },
  updateVotes: function(args){
    $(this.getVoteParent(args.target)).replaceWith(args.newDiv);
  },
  replaceWithSavedComment: function(args){
    $(this.getVoteParent(args.target)).replaceWith(args.newDiv);
  }
};