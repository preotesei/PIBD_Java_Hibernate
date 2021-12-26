<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ro">

<head>
    <title>Tabel Magazine</title>

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
        $(document).ready(function ()
        {
            $('#magazine_table').DataTable(
                {
                    pageLength: 10,
                    "language": {
                        "decimal": ",",
                        "emptyTable": "Nu există date în tabel",
                        "info": "Se afișează de la _START_ la _END_ din _TOTAL_ magazine",
                        "infoEmpty": "Se afișează 0 magazine",
                        "infoFiltered": "(selectate dintr-un total de _MAX_)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Afișează _MENU_ magazine/pagină",
                        "loadingRecords": "Se încarcă...",
                        "processing": "Se procesează...",
                        "search": "Căutare:",
                        "zeroRecords": "Nu s-a găsit niciun magazin",
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
    Magazine
</div>

<div class="container">
    <div class="row">

        <div class="col-sm text-center">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#magazine_update_modal">
                Modifică un magazin
            </button>
        </div>

        <div class="col-sm text-center menu">
            <button class="btn btn-primary btn-lg m-2 fix-button" onclick="location.href='/';" value="Home">
                Home
            </button>
        </div>

        <div class="col-sm text-center">
            <button type="submit" class="btn btn-primary btn-lg m-2 fix-button" data-bs-toggle="modal" data-bs-target="#magazine_delete_modal">
                Șterge un magazin
            </button>
        </div>
    </div>
</div>

<!-- Magazin Update Modal -->

<div class="modal fade" id="magazine_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="magazine_update_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="magazine_update_modal_label">Modifică un magazin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Magazine" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_magazin_Update" aria-label="Select magazin"
                                        id="Select_magazin_Update">
                                    <c:forEach items="${magazinList}" var="magazin">
                                        <option value="${magazin.IDMAGAZIN}">${magazin.NUME_MAGAZIN} (${magazin.ORAS})</option>
                                    </c:forEach>
                                </select>
                                <label for="Select_magazin_Update">Magazin</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="NUME_MAGAZIN_update" placeholder="Nume" aria-label="Nume" id="NUME_MAGAZIN_update"
                                       maxlength="50" >
                                <label for="NUME_MAGAZIN_update">Nume Magazin</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="tel" class="form-control" name="TELEFON_update" placeholder="Telefon" aria-label="Telefon"
                                       id="TELEFON_update" autocomplete="tel" maxlength="13" pattern="\+\d{11,12}">
                                <label for="TELEFON_update">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="email" class="form-control" name="EMAIL_update" placeholder="Email" aria-label="Email" id="EMAIL_update"
                                       autocomplete="email" maxlength="50"
                                       pattern="([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)">
                                <label for="EMAIL_update">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="ORAS_update" placeholder="Oras" aria-label="Oras" id="ORAS_update"
                                          maxlength="100"></textarea>
                                <label for="ORAS_update">Oras</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="ADRESA_update" placeholder="Adresa" aria-label="Adresa" id="ADRESA_update"
                                          maxlength="100"></textarea>
                                <label for="ADRESA_update">Adresa</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="CODPOSTAL_update" placeholder="Adresa" aria-label="Adresa" id="CODPOSTAL_update"
                                          maxlength="100"></textarea>
                                <label for="CODPOSTAL_update">Cod Postal</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="updateMagazin">Modifică</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Magazin Delete Modal -->
<div class="modal fade" id="magazine_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="magazine_delete_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="magazine_delete_modal_label">Șterge un magazin</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Magazine" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_Magazin_Delete" aria-label="Select Magazin"
                                        id="Select_Magazin_Delete">
                                    <%--@elvariable id="magazinList" type="java.util.List"--%>
                                        <c:forEach items="${magazinList}" var="magazin">
                                            <option value="${magazin.IDMAGAZIN}">${magazin.NUME_MAGAZIN} (${magazin.ORAS})</option>
                                        </c:forEach>
                                </select>
                                <label for="Select_Magazin_Delete">Magazin</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="deleteMagazin">Șterge</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="m-5">
    <table id="magazine_table" class="table table-striped cell-border">
        <thead>
        <tr class="table-dark text-center align-middle">
            <th scope="col">Nume</th>
            <th scope="col">Telefon</th>
            <th scope="col">Email</th>
            <th scope="col">Oras</th>
            <th scope="col">Adresa</th>
            <th scope="col">Cod Postal</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="magazinList" type="java.util.List"--%>
        <c:forEach var="magazin" items="${magazinList}">
            <tr class="align-middle">
                <td>${magazin.NUME_MAGAZIN}</td>
                <td>${magazin.TELEFON}</td>
                <td>${magazin.EMAIL}</td>
                <td>${magazin.ORAS}</td>
                <td>${magazin.ADRESA}</td>
                <td>${magazin.CODPOSTAL}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>

</html>