function convert(){
    var fd = new FormData();
    fd.append("myfile", $("#file-input")[0].files[0]);

    $("#convert-btn").hide();
    $("#loading-icon").show();
    $("#convert-result").hide();
    $("#error-result").hide();
    $.ajax({
        url: "/",
        type: "POST",
        dataType: "JSON",
        data: fd,
        contentType: false,
        processData: false
    })
        .done(function( res ) {
            $("#convert-btn").show();
            $("#loading-icon").hide();

            if(res.is_success){
                var link = res.link;
                $("#convert-result").show();
                $("#patch-download-link")
                    .attr("href", link)
                    .text(link);
            }
            else{
                $("#error-result").show();
            }


        });
}