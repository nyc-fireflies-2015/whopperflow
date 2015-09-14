$(document).ready(function(){
  var ctrl = new SortingController();
  $(".order_by a").on("click", function(event){
    ctrl.orderRiver(event.target)
  });
});