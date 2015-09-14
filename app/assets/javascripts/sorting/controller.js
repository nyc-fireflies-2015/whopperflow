function SortingController(){
  this.view = new RiverView();
}
SortingController.prototype = {
  orderRiver: function(eventTarget){
    var that = this;
    $.ajax($(eventTarget).attr("href")).done(function(newRiverDiv){
      that.view.refreshRiver(newRiverDiv);
    }).fail(function(error){
      alert(error.responseText);
    });
  }
};