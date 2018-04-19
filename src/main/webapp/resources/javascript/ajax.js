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


function readEmailCall (id){
    $.ajax({
        url: "ajaxcall",
        type: "POST",
        data: {
            'method': "readEmail",
            'id': id
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

function replyEmailCall (emailSubject,emailTo,emailFrom){
    $.ajax({
        url: "ajaxcall",
        type: "POST",
        data: {
            'method': "replyEmail",
            'emailSubject': emailSubject,
            'emailTo': emailTo,
            'emailFrom': emailFrom
        },
        success: function (data) {
            debugger;
            window.location = "contact.jsp";
        },
        error: function () {
            debugger;
            alert('Failed!')
        }
    });
}


function searchHotel(){
    $.ajax({
        url: "ajaxcall",
        type: "GET",
        data: {
            'method': "searchHotel"
        },
        success: function (data) {
            alert('Succes!' +data)
            window.location = "mapsHotel.jsp"
        },
        error: function () {
            debugger;
            alert('Failed!')
        }
    });
}

function searchPlaces(lat,long){
    $.ajax({
        url: "ajaxcall",
        type: "GET",
        data: {
            'method': "searchPlaces",
            'lat': lat,
            'long': long
        },
        success: function (data) {
            window.location = "mapsNearbyplaces.jsp";
        },
        error: function () {
            debugger;
            alert('Failed!')
        }
    });
}