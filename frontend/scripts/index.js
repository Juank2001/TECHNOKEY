$(document).ready(() => {
    console.log("jquery corriendo");
    const urlApi = "https://weekly-balanced-spider.ngrok-free.app/TECHNOKEY/backend/";
    init();

    $("#loginForm").on('submit', (e) => {
        e.preventDefault();
        let data = {
            usuario: $("#usuario").val(),
            password: $("#password").val()
        }
        console.log("Login submit: ", data);

        $.ajax({
            url: urlApi + '?op=1',
            method: "POST",
            data: data,
            beforeSend: () => {

            },
            success: (resp) => {
                resp = JSON.parse(resp)
                if (resp.status == "success") {
                    swal({
                        icon: resp.status,
                    });
                    localStorage.setItem("session", 'true')
                    init()
                } else {
                    swal({
                        title: resp.message,
                        icon: resp.status,
                    });
                }
            }
        })
    })

    $(document).on("click", ".close_vuelo_button", (e) => {
        e.preventDefault();


        let data = {
            id: e.target.value
        }

        $.ajax({
            url: urlApi + '?op=4',
            method: "POST",
            data: data,
            success: (resp) => {
                resp = JSON.parse(resp)
                if (resp.status == "success") {
                    swal({
                        icon: resp.status,
                        title: resp.message
                    });
                    listarVuelos(0)
                } else {
                    swal({
                        title: resp.message,
                        icon: resp.status,
                    });
                }
            }
        })
        
    });

    $("#new_vuelo_save").on('click', (e) => {
        e.preventDefault();

        let data = {
            origen: $("#origen").val(),
            destino: $("#destino").val(),
            costo: $("#costo").val()
        }

        $.ajax({
            url: urlApi + '?op=2',
            method: "POST",
            data: data,
            success: (resp) => {
                resp = JSON.parse(resp)
                if (resp.status == "success") {
                    swal({
                        icon: resp.status,
                        title: resp.message
                    });
                    listarVuelos(0)
                    $("#new_vuelo").modal('toggle')
                } else {
                    swal({
                        title: resp.message,
                        icon: resp.status,
                    });
                }
            }
        })
    })

    $("#salir").on('click', () => {
        localStorage.clear()
        init()
    })

    $("#next").on('click', () => {
        listarVuelos(1)
    })

    $("#prev").on('click', () => {
        listarVuelos(2)
    })

    function init() {
        let session = localStorage.getItem('session')

        if (session != undefined || session == true || session == "true") {
            console.log("hay sesion")
            $("#session").show()
            $("#not-session").hide()
            listarVuelos(0)
        } else {
            console.log('no hay sesion')
            $("#session").hide()
            $("#not-session").show()
        }
    }

    function listarVuelos(offsetVar) {
        let limit = 10
        let offset = 0

        if(offsetVar == 1){
            offset = offset + limit
        }else if(offsetVar == 2){
            offset = offset - limit
        }else if(offsetVar == 0){
            offset = 0
        }
        let data = {
            limit: limit,
            offset: offset
        }

        console.log(data)
        $.ajax({
            url: urlApi + '?op=3',
            method: "POST",
            data: data,
            success: (resp) => {
                resp = JSON.parse(resp)
                let table = ''
                if (resp.status == "success") {
                    for (let i = 0; i < resp.details.length; i++) {
                        let cerrado = false
                        if (resp.details[i].hora_llegada == null) {
                            resp.details[i].hora_llegada = '------'

                        } else {
                            cerrado = true
                        }
                        if (resp.details[i].tiempo == null) {
                            resp.details[i].tiempo = '------'
                        } else {
                            cerrado = true
                        }

                        let button = ""

                        if (cerrado) {
                            button = `<td>Vuelo Cerrado</td>`
                        } else {
                            button = `<td><button type="button" value="` + resp.details[i].vuelo_id + `" class="btn btn-success close_vuelo_button">Cerrar</button></td>`
                        }
                        table += `<tr>
                                    <td>`+ resp.details[i].vuelo_id + `</td>
                                    <td>`+ resp.details[i].fecha + `</td>
                                    <td>`+ resp.details[i].hora_salida + `</td>
                                    <td>`+ resp.details[i].hora_llegada + `</td>
                                    <td>`+ resp.details[i].tiempo + `</td>
                                    <td>`+ resp.details[i].destino + `</td>
                                    <td>`+ resp.details[i].origen + `</td>
                                    <td>`+ resp.details[i].costo + `</td>
                                    <td>`+ button + `</td>
                                </tr>`
                    }

                    $("#tableVuelos").html(table)
                } else {
                    swal({
                        title: resp.message,
                        icon: resp.status,
                    });
                }
            }
        })
    }
})