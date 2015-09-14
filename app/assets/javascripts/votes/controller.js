function VoteController(){
  this.view = new VoteView();
};

VoteController.prototype = {
  getFormData: function(form){
   var formData = {};
   formData.type = $(form).attr("method");
   formData.url = $(form).attr("action");
   formData.data = $(form).serialize();
   return formData;
  },
  upvoteQuestion: function(eventTarget){
    var that = this;
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(newVoteDiv){
      that.view.updateVotes({target: eventTarget, newDiv: newVoteDiv});
    }).fail(function(error){
      alert(error.responseText);
    });
  },
  downvoteQuestion: function(eventTarget){
    var that = this;
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(newVoteDiv){
      that.view.updateVotes({target: eventTarget, newDiv: newVoteDiv});
    }).fail(function(error){
      alert(error.responseText);
    });
  },  
  upvoteAnswer: function(eventTarget){
    var that = this;
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(newVoteDiv){
      that.view.updateVotes({target: eventTarget, newDiv: newVoteDiv});
    }).fail(function(error){
      alert(error.responseText);
    });
  },
  downvoteAnswer: function(eventTarget){
    var that = this;
    var formData = this.getFormData(eventTarget);
    $.ajax(formData).done(function(newVoteDiv){
      that.view.updateVotes({target: eventTarget, newDiv: newVoteDiv});
    }).fail(function(error){
      alert(error.responseText);
    });
  }
};
