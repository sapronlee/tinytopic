  function loadComments(id){
    if($("#post"+id+" .comments:hidden").length > 0){
      $("#comments").show();
      return false;
    }
    if($("#post"+id+" .comments").length > 0){
      $("#comments").hide();
      return false;
    }

    $.ajax({
      url : "/comments",
      data : { commentable_type : "Post", commentable_id : id },
      type : "GET",
      dataType : "html",
      success : function(html){
        if(html == ""){
          alert("Error.");
        }
        $("#comments").remove();
        $("#post"+id).append(html);
      }
    });
    return false;
  }

