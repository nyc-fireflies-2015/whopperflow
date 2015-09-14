$(document).ready(function(){
  var ctrl = new SortingController();
  $(".sort_link").on("click", function(event){
    event.preventDefault();
    ctrl.orderRiver(event.target);
  });
});