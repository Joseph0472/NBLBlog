//window.onload = function() {

import SimpleUploadAdapter from '@ckeditor/ckeditor5-upload/src/adapters/simpleuploadadapter';

ClassicEditor
    .create( document.querySelector( '#new-article-body' ), {
        plugins: [SimpleUploadAdapter],
        simpleUpload: {
            // The URL that the images are uploaded to.
            uploadUrl: './editorServlet',

            // Headers sent along with the XMLHttpRequest to the upload server.
            headers: {
                'X-CSRF-TOKEN': 'CSFR-Token',
                Authorization: 'Bearer <JSON Web Token>'
            }
        }
    })
    .then( editor => {
        console.log( editor );we
    } )
    .catch( error => {
        console.error( error );
    } );

//}