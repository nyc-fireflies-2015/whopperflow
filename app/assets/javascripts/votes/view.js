function View(){

}
View.prototype = {
  getVoteParent: function(eventTarget){
    return $(document).find(eventTarget).closest(".vote");
  },
  updateVotes: function(args){
    console.log(args.target);
    console.log(args.newDiv);
    $(this.getVoteParent(args.target)).replaceWith(args.newDiv);
  }
};