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


function votePost(id,type){
  if(type == 1){
    currentVote = parseInt($("#post"+id+" .vote_up").text()) + 1;
    $("#post"+id+" .vote_up").replaceWith('<span class="vote_up">'+currentVote+'人叫好</span>');
  }
  else{
    currentVote = parseInt($("#post"+id+" .vote_down").text()) - 1;
    $("#post"+id+" .vote_down").replaceWith('<span class="vote_down">'+currentVote+'囧</span>');
  }
  $.post("/posts/"+id+"/vote.js", { up : type });
  return false;
}
