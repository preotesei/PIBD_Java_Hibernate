<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ro">

<head>

    <title> Afișare Clienți </title>
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
            $('#clienti_table').DataTable(
                {
                    pageLength: 10,
                    "language": {
                        "decimal": ",",
                        "emptyTable": "Nu există date în tabel",
                        "info": "Se afișează de la _START_ la _END_ din _TOTAL_ clienti",
                        "infoEmpty": "Se afișează 0 clienti",
                        "infoFiltered": "(selectați dintr-un total de _MAX_)",
                        "infoPostFix": "",
                        "thousands": ".",
                        "lengthMenu": "Afișează _MENU_ clienti/pagină",
                        "loadingRecords": "Se încarcă...",
                        "processing": "Se procesează...",
                        "search": "Căutare:",
                        "zeroRecords": "Nu s-a găsit niciun client",
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
                <button class="btn btn-primary btn-lg m-2 fix-button" type="submit" onclick="location.href='/';" value="Pagina Principală"
                        style="transform: translate(149px);filter: contrast(100%) invert(0%);">Pagina Principală
                </button>
            </div>
            <div class="col">
                <h2 class="d-xxl-flex"
                    style="padding-top: 10px;padding-right: 34px;padding-left: 34px;font-family: Kalam, serif;transform: translate(-144px);">
                    <br><strong>Tabel Clienți</strong><br><br><br></h2>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                        data-bs-target="#clienti_update_modal" style="transform: translate(464px);height: 38px;">
                    Modifică Client
                </button>
            </div>
            <div class="col">
                <button class="btn btn-primary" type="button" data-bs-toggle="modal"
                        data-bs-target="#clienti_delete_modal" style="transform: translate(261px);">Șterge Client
                </button>
            </div>
        </div>
    </div>
</section>

<!-- Client Update Modal -->
<div class="modal fade" id="clienti_update_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_update_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_update_modal_label">Modifică un client</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_client_Update" aria-label="Select client"
                                        id="Select_client_Update">
                                    <c:forEach items="${clientList}" var="client">
                                        <option value="${client.IDCLIENT}">${client.PRENUME} ${client.NUME} (${client.CNP})</option>
                                    </c:forEach>
                                </select>
                                <label for="Select_client_Update">Client</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Prenume_update" placeholder="Prenume" aria-label="Prenume"
                                       id="Prenume_update" maxlength="50" pattern="[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+(-[A-ZĂÂÎȚȘ]{1}[a-zăâîțș]+)*"
                                       autocomplete="given-name">
                                <label for="Prenume_update">Prenume</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="Nume_update" placeholder="Nume" aria-label="Nume" id="Nume_update"
                                       maxlength="50" pattern="[A-Za-zăâîțșĂÂÎȚȘ]+(-[A-Za-zăâîțșĂÂÎȚȘ]+)*" autocomplete="family-name">
                                <label for="Nume_update">Nume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="CNP_update" placeholder="Cod Numeric Personal (CNP)" aria-label="CNP"
                                       id="CNP_update" maxlength="13" pattern="\d{13}">
                                <label for="CNP_update">Cod Numeric Personal (CNP)</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="tel" class="form-control" name="Telefon_update" placeholder="Telefon" aria-label="Telefon"
                                       id="Telefon_update" autocomplete="tel" maxlength="13" pattern="\+\d{11,12}">
                                <label for="Telefon_update">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="email" class="form-control" name="Email_update" placeholder="Email" aria-label="Email" id="Email_update"
                                       autocomplete="email" maxlength="50"
                                       pattern="([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)">
                                <label for="Email_update">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="oras_update" placeholder="Oras" aria-label="Oras" id="oras_update"
                                          maxlength="100"></textarea>
                                <label for="oras_update">Oras</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="adresa_update" placeholder="Adresa" aria-label="Adresa" id="adresa_update"
                                          maxlength="100"></textarea>
                                <label for="adresa_update">Adresa</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="cod_postal_update" placeholder="Adresa" aria-label="Adresa" id="cod_postal_update"
                                          maxlength="100"></textarea>
                                <label for="cod_postal_update">Cod Postal</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="updateClient">Modifică</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Clienti Delete Modal -->
<div class="modal fade" id="clienti_delete_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_delete_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_delete_modal_label">Șterge un client</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="Select_client_Delete" aria-label="Select client"
                                        id="Select_client_Delete">
                                    <%--@elvariable id="clientList" type="java.util.List"--%>
                                        <c:forEach items="${clientList}" var="client">
                                            <option value="${client.IDCLIENT}">${client.PRENUME} ${client.NUME} (${client.CNP})</option>
                                        </c:forEach>
                                </select>
                                <label for="Select_client_Delete">Client</label>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="deleteClient">Șterge</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="m-5">
    <table id="clienti_table" class="table table-striped cell-border">
        <thead>
        <tr class="table-dark text-center align-middle">
            <th scope="col">Nume</th>
            <th scope="col">CNP</th>
            <th scope="col">Telefon</th>
            <th scope="col">Email</th>
            <th scope="col">Oras</th>
            <th scope="col">Adresa</th>
            <th scope="col">Cod Postal</th>
        </tr>
        </thead>

        <tbody>
        <%--@elvariable id="clientList" type="java.util.List"--%>
        <c:forEach var="client" items="${clientList}">
            <tr class="align-middle">
                <td>${client.PRENUME} ${client.NUME}</td>
                <td class="text-center">${client.CNP}</td>
                <td class="text-center">${client.TELEFON}</td>
                <td>${client.EMAIL}</td>
                <td>${client.ORAS}</td>
                <td class="text-center">${client.ADRESA}</td>
                <td class="text-center">${client.CODPOSTAL}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="static/clienti/assets/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>