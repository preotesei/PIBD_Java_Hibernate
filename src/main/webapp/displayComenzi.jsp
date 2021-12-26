<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ro">

<head>

    <title>Tabel Programări</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core/dist/umd/popper.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Readex+Pro" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">


    <script>
        $(document).ready(function () {
            $('#comenzi_table').DataTable(
                {
                    pageLength: 10,
                    "language": {
                        "decimal": ",",
                        "emptyTable": "Nu există date în tabel",
                        "info": "Se afișează de la _START_ la _END_ din _TOTAL_ comenzi",
                        "infoEmpty": "Se afișează 0 comenzi",
                        "infoFiltered": "(selectate dintr-un total de _MAX_)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Afișează _MENU_ comenzi/pagină",
                        "loadingRecords": "Se încarcă...",
                        "processing": "Se procesează...",
                        "search": "Căutare:",
                        "zeroRecords": "Nu s-a găsit nicio comenzi",
                        "paginate": {
                            "first": "Prima",
                            "last": "Ultima",
                            "next": "Înainte",
                            "previous": "Înapoi"
                        }
                    }
                }
            );
        });
    </script>

</head>

<body>

<div class="m-4 title">
    Comenzi
</div>

<div class="container">
    <div class="row">

        <div class="col-sm text-center">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#comenzi_update_modal">
                Modifică o comanda
            </button>
        </div>

        <div class="col-sm text-center menu">
            <button class="btn btn-primary btn-lg m-2 fix-button" onclick="location.href='/';" value="Home">
                Home
            </button>
        </div>

        <div class="col-sm text-center">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#comenzi_delete_modal">
                Șterge o comandă
            </button>
        </div>
    </div>
</div>

<!-- Comenzi Update Modal -->
<div class="modal fade" id="comenzi_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="comenzi_update_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="comenzi_update_modal_label">Modifică o comandă</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Comenzi" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_comanda_Update" aria-label="Comanda"
                                        id="Select_comanda_Update">
                                    <%--@elvariable id="comandaList" type="java.util.List"--%>
                                    <c:forEach var="comanda" items="${comandaList}">
                                        <option value="${comanda.IDCOMANDA}">${comanda.DATA_PLASARII} ${comanda.ORA_PLASARII}
                                            - ${comanda.CLIENT.NUME} (${comanda.CLIENT.CNP})
                                        </option>
                                    </c:forEach>
                                </select>
                                <label for="Select_comanda_Update">Comandă</label>
                            </div>
                        </div>



                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="STATUS_COMANDA_UPDATE" aria-label="STATUS_COMANDA" id="STATUS_COMANDA_UPDATE" required>
                                    <option value="Anulată"> Anulată </option>
                                    <option value="Livrată"> Livrată </option>
                                    <option value="În așteptare"> În așteptare </option>
                                    <option value="Returnata"> Returnată </option>
                                </select>
                                <label for="STATUS_COMANDA_UPDATE">Status Comandă</label>
                            </div>
                        </div>



<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="text" class="form-control" name="STATUS_COMANDA_UPDATE" placeholder="STATUS_COMANDA"--%>
<%--                                       aria-label="STATUS_COMANDA" id="STATUS_COMANDA_UPDATE"--%>
<%--                                       maxlength="20">--%>
<%--                                <label for="STATUS_COMANDA_UPDATE">Status Comandă</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="DATA_PLASARII_UPDATE" placeholder="DATA_PLASARII"
                                       aria-label="DATA_PLASARII" id="DATA_PLASARII_UPDATE"
                                       maxlength="50">
                                <label for="DATA_PLASARII_UPDATE">Data plasării</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="time" class="form-control" name="ORA_PLASARII_UPDATE" placeholder="ORA_PLASARII"
                                       aria-label="ORA_PLASARII" id="ORA_PLASARII_UPDATE" required>
                                <label for="ORA_PLASARII_UPDATE">Ora plasării</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="DATA_LIVRARII_UPDATE" placeholder="DATA_LIVRARII"
                                       aria-label="DATA_LIVRARII" id="DATA_LIVRARII_UPDATE"
                                       maxlength="50">
                                <label for="DATA_LIVRARII_UPDATE">Data livrării</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="time" class="form-control" name="ORA_LIVRARII_UPDATE" placeholder="ORA_LIVRARII"
                                       aria-label="ORA_LIVRARII" id="ORA_LIVRARII_UPDATE">
                                <label for="ORA_LIVRARII_UPDATE">Ora livrării</label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                        <button type="submit" class="btn btn-primary" name="updateComanda">Modifică</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Comanda Delete Modal -->
<div class="modal fade" id="comenzi_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="comenzi_delete_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="comenzi_delete_modal_label">Șterge o comanda</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Comenzi" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_comanda_Delete" aria-label="Select comanda"
                                        id="Select_comanda_Delete">
                                    <%--@elvariable id="comandaList" type="java.util.List"--%>
                                    <c:forEach var="comanda" items="${comandaList}">
                                        <option value="${comanda.IDCOMANDA}">${comanda.DATA_PLASARII} ${comanda.ORA_PLASARII}
                                            - ${comanda.CLIENT.NUME} (${comanda.CLIENT.CNP})
                                        </option>
                                    </c:forEach>
                                </select>
                                <label for="Select_comanda_Delete">Programare</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="deleteComanda">Șterge</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="m-5">
    <table id="comenzi_table" class="table table-striped cell-border">
        <thead>
        <tr class="table-dark text-center align-middle">
            <th scope="col">Status Comandă</th>
            <th scope="col">Timpul Plasării</th>
            <th scope="col">Timpul Livrării</th>
            <th scope="col">Nume Client</th>
            <th scope="col">CNP Client</th>
            <th scope="col">Telefon Client</th>
            <th scope="col">Magazin</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="comandaList" type="java.util.List"--%>
        <c:forEach var="comanda" items="${comandaList}">
            <tr class="align-middle">
                <td class="text-center">${comanda.STATUS_COMANDA}</td>
                <td class="text-center">${comanda.DATA_PLASARII} ${comanda.ORA_PLASARII}</td>
                <td class="text-center">${comanda.DATA_LIVRARII} ${comanda.ORA_LIVRARII}</td>
                <td class="text-center">${comanda.CLIENT.NUME} ${comanda.CLIENT.PRENUME}</td>
                <td class="text-center">${comanda.CLIENT.CNP}</td>
                <td class="text-center">${comanda.CLIENT.TELEFON}</td>
                <td class="text-center">${comanda.MAGAZIN.NUME_MAGAZIN}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>

</html>