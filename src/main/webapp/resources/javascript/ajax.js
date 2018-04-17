/**
 * Created by Silviu Iancu on 4/17/2018.
 */

function myFunction (id,location){
$.ajax({
    url: "sendemail",
    type: "POST",
    data: {
        'id': id,
        'action': location
    },
    success: function (data) {
        debugger;
        alert('Success!')
    },
    error: function () {
        debugger;
        alert('Failed!')
    }
});
}