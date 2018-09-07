
$(function() {
    $("select#goal_goal_id").on("change", function() {
        $.ajax({
            url:  "/filter_targets_by_goals",
            type: "GET",
            data: { selected_goal: $(this).val() }
        });
    });

});
