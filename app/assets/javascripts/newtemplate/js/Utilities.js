var Utilities = {

    dom: {
        'barloadermodal': $('#barloadermodal')
    },
    alertModal: function (message, type, cerrarantesde) {

        var loaderBg = '#ff6849';
        var icon = 'error';

        var titulo = '';
        if (type == 'error') {
            var loaderBg = '#ff6849';
            var icon = 'error';
            titulo = 'ERROR'
        }
        if (type == 'success') {
            var loaderBg = '#ff6849';
            var icon = 'success';
            titulo = 'FELICIDADES'
        }
        if (type == 'warning') {
            var loaderBg = '#ff6849';
            var icon = 'warning';
            titulo = 'ATENCION'
        }
        if (type == 'info') {
            var loaderBg = '#ff6849';
            var icon = 'info';
            titulo = 'INFORMACION'
        }

        var hideAfter = 4500;
        if (cerrarantesde != true) {
            hideAfter = cerrarantesde;
        }
        if (cerrarantesde == false) {
            hideAfter = false;
        }

        $.toast({
            heading: titulo,
            text: message,
            position: 'top-right',
            loaderBg: loaderBg,
            icon: icon,
            hideAfter: hideAfter,
            stack: 6

        });
    },
    closeAlertModal: function () {
        $(".jq-toast-single").css('display', 'none');
    },
    showPreloader: function () {
        /*$('#barloadermodal').modal({
         show: true,
         backdrop: 'static'
         });*/

        $('#wrapper').block({
            message: '<p style="margin:0;padding:8px;font-size:24px;">Por favor espere...</p>'
            , css: {
                color: '#fff'
                , border: '1px solid #fb9678'
                , backgroundColor: '#fb9678'
            }
        });


    },
    hiddePreloader: function () {

        $('#wrapper').unblock();
        // Utilities.hiddePreloader();
    },
    hideModal: function (modal) {
        $("#" + modal).modal('hide');

    },

    setfocus: function (element, time) {

        if (time == undefined) {
            time = 600
        }
        setTimeout(function () {

            $("" + element + "").focus();

        }, time);
    },




    validateEmail: function (email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    },
    FlotChart: function (element, barData, barOptions, animation) {
        //Flot Bar Chart


        if (animation == true) {

            var plot = $.plotAnimator(element, barData, barOptions);
        } else {
            var plot = $.plot(element, barData, barOptions);
        }


        return plot;
    },


    init: function (droguerias, unidades) {
        this.unidades = unidades;

        this.droguerias = droguerias;

    }


}

