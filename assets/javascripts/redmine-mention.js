setTimeout(function(){
$(function(){
    $('.wiki-edit').mentionsInput({source: function(request, response){
        project_id = $('form').first().attr('action').replace( /\/projects\//, '' );
        project_id = project_id.replace( /\/search/, '' );
        $.ajax({
            url: '/mention/search',
            data: {'search_tag': request, project_id: project_id},
            success: function(result) {
                response(result['users'])
            }
        });
    }});
    $('.mentions-input').attr('style', 'display:block!important;');
    $('.highlighter').css('width', '95%');
    $('.jstEditor').css('margin-top', "34px;");
});}, 3000);


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
}, 3000);
//need this delay to make sure redactor is loaded, and we've bind our mention listener to redactor's body. This is the only one
//way to achieve this. Redactor's callbacks wont work because they fires few moments before redactor have been built into DOM

