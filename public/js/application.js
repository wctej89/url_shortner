$(document).ready(function() {
    $("#url").on("submit",function(ev){
    console.log("in here");
    ev.preventDefault();
    $.ajax({
      type: "post",
      url: '/',
      data: $(this).serialize()
    }).done(function (response) {
      console.log(response)
      if(response.url)
      {
        $('#error').slideUp();
        $("#short").val(window.location.host + "/"+response.url).focus().select();
        $('body').append(response.click_count)
      }
      else
        $('#error').html(response.errors).slideDown();
    });
  });
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
