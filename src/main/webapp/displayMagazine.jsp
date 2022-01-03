<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ro">

<head>
    <title> Afișare Magazine </title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="static/clienti/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Armata&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kalam&amp;display=swap">
    <link rel="stylesheet" href="static/clienti/assets/css/styles.css">

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

<section style="font-family: Armata, sans-serif;color: var(--bs-black-rgb);">
    <div class="container-fluid"
         style="background: #ffffff;margin-left: Auto;margin-right: Auto;padding-top: 30px;height: 200px;filter: grayscale(0%);">
        <div class="row">
            <div class="col">
                <button class="btn btn-primary btn-lg m-2 fix-button" type="button" onclick="location.href='/';" value="Pagina Principală"
                        style="transform: translate(149px);filter: contrast(100%) invert(0%);">Pagina Principală
                </button>
            </div>
            <div class="col">
                <h2 class="d-xxl-flex"
                    style="padding-top: 10px;padding-right: 34px;padding-left: 34px;font-family: Kalam, serif;transform: translate(-144px);">
                    <br><strong>Tabel Magazine</strong><br><br><br></h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                        data-bs-target="#magazine_update_modal" style="transform: translate(464px);height: 38px;">
                    Modifică Magazin
                </button>
            </div>
            <div class="col">
                <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                        data-bs-target="#magazine_delete_modal" style="transform: translate(261px);">Șterge Magazin
                </button>
            </div>
        </div>
    </div>
</section>

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

<script src="static/clienti/assets/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>