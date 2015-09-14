function RiverView(){

}
RiverView.prototype = {
  refreshRiver: function(newRiverDiv){
    $(document).find(".question-river").replaceWith(newRiverDiv);
  }
};