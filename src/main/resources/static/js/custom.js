
    $(document).ready(function () {

            // Bind a callback that executes when document.location.hash changes.
            $(window).bind("hashchange", function (e) {
                var url = window.location.hash.replace("#", "");

                if (url == "/notActivatedUsers" || url == "/users" || url == "/createArticle" ||
                    url == "/conferences" || url == "/subjects" || url == "/files") {
                    loadSubPage(url);
                }
            });
        });

        function activateUser(activateUrl) {
            $.ajax({
                type: 'PUT',
                url: activateUrl,
                data: null,
                success: function () {
                    loadSubPage("/notActivatedUsers")
                    //window.location.reload();
                }
            });
        }

    /*$("#delete_file_form").submit(function (event) {
                    event.preventDefault();

                    updateAllMessageForms();

                    var $form = $(this);
                    var formUrl = $form.attr('action');
                    var method = $form.attr('method');

                    var formData = getFormData($form);

                    console.log("formUrl: " + formUrl);
                    console.log("method: " + method);
                    console.log("formData: " + formData);

                    var xhr = $.ajax({
                        headers: {
                            'Accept': 'multipart/form-data;charset=UTF-8',
                            'Content-Type': 'multipart/form-data;charset=UTF-8'
                        },
                        type: method,
                        url: formUrl,
                        data: formData,
                        success: function (data) {
                            loadSubPage("/userFiles");
                            M.toast({
                                html: xhr.getResponseHeader("message"), timeRemaining: 10000
                            });
                        },
                        error: function (data) {
                            // loadSubPage("/userFiles");
                            M.toast({
                                html: xhr.getResponseHeader("message"), timeRemaining: 10000
                            });
                        }
                    });
                });

    */



        function loadSubPage(url) {
            $.ajax({
                type: 'GET',
                url: url,
                data: null,
                success: function (receivedView) {
                    $("#content").html(receivedView);
                }
            });
            console.log("url: " + url);
        }


        $("#create-article-form").submit(function (event) {
                event.preventDefault();

                updateAllMessageForms();

                var $form = $(this);
                var formUrl = $form.attr('action');
                var method = $form.attr('method');

                var formData = getFormData($form);

                console.log("formUrl: " + formUrl);
                console.log("method: " + method);
                console.log("formData: " + formData);

                var xhr = $.ajax({
                    headers: {
                        'Accept': 'application/json;charset=UTF-8',
                        'Content-Type': 'application/json;charset=UTF-8'
                    },
                    type: method,
                    url: formUrl,
                    data: formData,
                    // statusCode: {
                    //     200: function (data) {
                    //         M.toast({
                    //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
                    //         });
                    //     },
                    //     201: function (data) {
                    //         M.toast({
                    //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
                    //         });
                    //         // M.toast(data.getResponseHeader("successMessage"), 10000);
                    //     },
                    //     417: function (data) {
                    //         M.toast({
                    //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
                    //         });
                    //         // M.toast(data.getResponseHeader("validationMessage"), 10000);
                    //     },
                    //     500: function (data) {
                    //         M.toast({
                    //             html: xhr.getResponseHeader("message"), timeRemaining: 10000
                    //         });
                    //         // M.toast(data.getResponseHeader("errorMessage"), 10000, 'red');
                    //     }
                    // }
                    // ,

                    success: function (data) {
                        loadSubPage("/createArticle");
                        M.toast({
                            html: xhr.getResponseHeader("message"), timeRemaining: 10000
                        });
                    },
                    error: function (data) {
                        // loadSubPage("/createArticle");
                        M.toast({
                            html: xhr.getResponseHeader("message"), timeRemaining: 10000
                        });
                    }
                });
            });

            function getFormData($form) {
                var subjectsData = M.FormSelect.getInstance($("#subjects")).getSelectedValues();
                var usersData = M.FormSelect.getInstance($("#users")).getSelectedValues();

                var unindexed_array = $form.serializeArray();
                var indexed_array = {};

                $.each(unindexed_array, function (i, v) {
                    if (v.name == "subjects") {
                        indexed_array[v.name] = subjectsData;
                    } else if (v.name == "users") {
                        indexed_array[v.name] = usersData;
                    } else if (v.name == "conference") {
                        indexed_array[v.name] = parseInt(v.value);
                    } else {
                        indexed_array[v.name] = v.value;
                    }
                });

                return JSON.stringify(indexed_array);
            }

            function updateAllMessageForms()
            {
                for (var instance in CKEDITOR.instances) {
                    CKEDITOR.instances[instance].updateElement();
                }
            }

            $("#add_file_form").submit(function (event) {
                                                event.preventDefault();

                                                updateAllMessageForms();

                                                var $form = $(this);
                                                var formUrl = $form.attr('action');
                                                var method = $form.attr('method');

                                                //var formData = new FormData();
                                                var formData = new FormData($form);

                                                console.log("formUrl: " + formUrl);
                                                console.log("method: " + method);
                                                console.log("formData: " + formData);

                                                var xhr = $.ajax({
                                                    type: method,
                                                    enctype: "multipart/form-data",
                                                    url: formUrl,
                                                    data: formData,
                                                    processData: false,
                                                    contentType: false,
                                                    cache: false,
                                                    timeout: 600000,
                                                    success: function (data) {
                                                        loadSubPage("/files");
                                                        M.toast({
                                                            html: xhr.getResponseHeader("message"), timeRemaining: 10000
                                                        });
                                                    },
                                                    error: function (data) {
                                                        // loadSubPage("/files");
                                                        M.toast({
                                                            html: xhr.getResponseHeader("message"), timeRemaining: 10000
                                                        });
                                                    }
                                                });
                                            });