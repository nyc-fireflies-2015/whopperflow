function SortingController(){

}
SortingController.prototype = {
  getFormData: function(form){
   var formData = {};
   formData.type = $(form).attr("method");
   formData.url = $(form).attr("action");
   formData.data = $(form).serialize();
   return formData;
  },

};