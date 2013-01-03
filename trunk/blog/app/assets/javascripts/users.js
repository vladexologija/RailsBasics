$(function(){
  $("#update_preferences").bind("ajax:success", function(event, data){
      $("#user_actions").html(data);
  });
});
