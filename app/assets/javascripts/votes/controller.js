function Controller(){
}

Controller.prototype = {
  getVoteParent: function(eventTarget){
    return $(document).find(eventTarget).closest(".vote");
  },
  getFormData: function(form){
   var formData = {};
   formData.type = $(form).attr("method");
   formData.url = $(form).attr("action");
   formData.data = $(form).serialize();
   return formData;
  },
  upvoteQuestion: function(eventTarget){
    var targetDiv = this.getVoteParent(eventTarget);
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(newVoteDiv){
     console.log(newVoteDiv);
    }).fail(function(error){
      alert(error.responseText);
    });
  },
  downvoteQuestion: function(target){
    that = target;
  }
};
