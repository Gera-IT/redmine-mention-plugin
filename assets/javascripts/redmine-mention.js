$(function(){
    $('.redactor-editor').mentionsInput({source: function(request, response){
        project_id = $('form').first().attr('action').replace( /\/projects\//, '' );
        project_id = project_id.replace( /\/search/, '' );
        $.ajax({
            url: '/mention/search',
            data: {'search_tag': request, project_id: project_id},
            success: function(result) {
                response(result['users'])
            }
        });
    }})
});

setTimeout(function(){
    $(document).ready(function(){
        $('.redactor-editor').mentionsInput({source: function(request, response){
            project_id = $('form').first().attr('action').replace( /\/projects\//, '' );
            project_id = project_id.replace( /\/search/, '' );
            $.ajax({
                url: '/mention/search',
                data: {'search_tag': request, project_id: project_id},
                success: function(result) {
                    response(result['users'])
                }
            });
        }})
    });
}, 1000);
