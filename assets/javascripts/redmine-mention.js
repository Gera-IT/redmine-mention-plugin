$(function(){
    $('.redactor-editor').mentionsInput({source: function(request, response){
        console.log(request);
        project_id = $('form').first().attr('action').replace( /\/projects\//, '' );
        project_id = project_id.replace( /\/search/, '' );
        var data = [];
        $.ajax({
            url: '/mention/search',
            data: {'search_tag': request, project_id: project_id},
            success: function(result) {
                console.log(result);
                response(result['users'])
            }
        });
    }})
});

setTimeout(function(){
    $(document).ready(function(){
        $('.redactor-editor').mentionsInput({source: function(request, response){
            console.log(request);
            project_id = $('form').first().attr('action').replace( /\/projects\//, '' );
            project_id = project_id.replace( /\/search/, '' );
            var data = [];
            $.ajax({
                url: '/mention/search',
                data: {'search_tag': request, project_id: project_id},
                success: function(result) {
                    console.log(result);
                    response(result['users'])
                }
            });
        }})
    });
}, 1000);
