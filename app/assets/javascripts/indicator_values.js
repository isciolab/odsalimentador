var indicadorValue = {
    initNewIndicadorValue: function () {

        jQuery(".chosen").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });

        $("select#goal_id_index").on("change", function () {
            $.ajax({
                url: "/filter_targets_by_goals",
                type: "GET",
                data: {selected_goal: $(this).val(), selectargetid: "target_id"}
            });
        });

        indicadorValue.tableCargarTodos();

    },

    tableCargarTodos: function () {

        $.ajax({
            type: 'GET',
            data: {goal: $("#goal_id_index").val(), target: $("#target_id").val(), anio: $("#anio").val()},
            dataType: "html",
            url: base_url + '/indicator_values/getvalueindicators',
            success: function (data) {

                console.log('sdsd',data)
                $('#tablanewindicvalue').DataTable();
            }
        });

    }
}


