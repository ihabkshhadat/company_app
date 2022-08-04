$(document).ready(function () {
    $('#projectTable').DataTable();
    $('#projectFilterForm').submit(function (e) {
        e.preventDefault();
        var form = $(this);
        $('#projectTable').DataTable({
            destroy: true,
            ajax: {
                type: 'GET',
                url: form.attr('action'),
                dataType: 'json',
                dataSrc: "",
                data: function (d) {
                    var from_data = form.serializeArray();
                    $.each(from_data, function (key, val) {
                        d[val.name] = val.value;
                    });
                },
            },
            columns: [
                {data: 'external_id'},
                {data: 'user.last_name'},
                {data: 'project_domain'},
                {data: 'description'},
                {data: 'budget'},
                {data: 'time_estimate'},
            ],

        }).draw();
    });
    $('#company').on('change', function () {
        $.get('/filter_user_by_company', {company: this.value}, null, 'script');
    });
});
