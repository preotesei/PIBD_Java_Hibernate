<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <title>JSP - Hello World</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" charset="UTF-8">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Readex+Pro" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">

</head>

<body>

<div class="m-4 title">
    Relaționarea dintre clienți și magazine <img src="https://i.kym-cdn.com/photos/images/facebook/001/861/983/bf5.png" alt="5head" width="40" height="49">
</div>

<div class="container">
    <div class="row">
        <div class="col-sm text-center">
            <div class="m-3 header">
                Clienți
            </div>

            <form role="form" action="Clienti" method="GET">
                <input type="submit" class="btn btn-primary btn-lg m-2" name="displayClienti" value="Tabelul cu clienți">
            </form>

            <button type="button" class="btn btn-primary btn-lg m-2" data-bs-toggle="modal" data-bs-target="#clienti_add_modal">
                Adaugă un client
            </button>

        </div>
        <div class="col-sm text-center">
            <div class="m-3 header">
                Magazine
            </div>


            <form role="form" action="Magazine" method="POST">
                <input type="submit" class="btn btn-primary btn-lg m-2" name="displayMagazine" value="Tabelul cu magazine">
            </form>
            <button type="button" class="btn btn-primary btn-lg m-2" data-bs-toggle="modal" data-bs-target="#magazine_add_modal">
                Adaugă un magazin
            </button>

        </div>
        <div class="col-sm text-center">
            <div class="m-3 header">
                Comenzi
            </div>


            <form role="form" action="Comenzi" method="POST">
                <input type="submit" class="btn btn-primary btn-lg m-2" name="displayComenzi" value="Tabelul cu comenzi">
            </form>
            <button type="button" class="btn btn-primary btn-lg m-2" data-bs-toggle="modal" data-bs-target="#comenzi_add_modal">
                Adaugă o comandă
            </button>
        </div>
    </div>
</div>


<%-- Clienti add modal --%>

<div class="modal fade" id="clienti_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="clienti_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="clienti_add_modal_label">Adaugă un client nou</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Clienti" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="cnp_add" placeholder="CNP" aria-label="CNP" id="cnp_add"
                                       maxlength="50" pattern="\d{13}" required>
                                <label for="cnp_add">CNP</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="nume_add" placeholder="Nume" aria-label="Nume" id="nume_add"
                                          maxlength="100" pattern="[A-Za-zăâîțșĂÂÎȚȘ]+(-[A-Za-zăâîțșĂÂÎȚȘ]+)*" required>
                                <label for="nume_add">Nume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="prenume_add" placeholder="Prenume" aria-label="Prenume" id="prenume_add"
                                          maxlength="100" pattern="[A-Za-zăâîțșĂÂÎȚȘ]+(-[A-Za-zăâîțșĂÂÎȚȘ]+)*" required>
                                <label for="prenume_add">Prenume</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="telefon_add" placeholder="Telefon" aria-label="Telefon" id="telefon_add"
                                          maxlength="100" required></textarea>
                                <label for="telefon_add">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="email_add" placeholder="Email" aria-label="Email" id="email_add"
                                          maxlength="100" required></textarea>
                                <label for="email_add">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="oras_add" placeholder="Oras" aria-label="Oras" id="oras_add"
                                          maxlength="100" required></textarea>
                                <label for="oras_add">Oras</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="adresa_add" placeholder="Adresa" aria-label="Adresa" id="adresa_add"
                                          maxlength="100" required></textarea>
                                <label for="adresa_add">Adresa</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="cod_postal_add" placeholder="Cod_postal" aria-label="Cod_postal" id="cod_postal_add"
                                          maxlength="100" required></textarea>
                                <label for="cod_postal_add">Cod Postal</label>
                            </div>
                        </div>

                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addProces">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%-- Magazine add modal --%>

<div class="modal fade" id="magazine_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="magazine_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="magazine_add_modal_label">Adaugă un magazin nou</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Magazine" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="nume_magazin_add" placeholder="Nume Magazin" aria-label="Nume Magazin" id="nume_magazin_add"
                                       maxlength="50" autocomplete="given-name" required>
                                <label for="Prenume_add">Nume Magazin</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="telefon_magazin_add" placeholder="Telefon" aria-label="Telefon" id="telefon_magazin_add"
                                          maxlength="100" required></textarea>
                                <label for="telefon_magazin_add">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="email_magazin_add" placeholder="Email" aria-label="Email" id="email_magazin_add"
                                          maxlength="100" required></textarea>
                                <label for="email_magazin_add">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="oras_magazin_add" placeholder="Oras" aria-label="Oras" id="oras_magazin_add"
                                          maxlength="100" required></textarea>
                                <label for="oras_magazin_add">Oras</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="adresa_magazin_add" placeholder="Adresa" aria-label="Adresa" id="adresa_magazin_add"
                                          maxlength="100" required></textarea>
                                <label for="adresa_magazin_add">Adresa</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="cod_postal_magazin_add" placeholder="Cod_postal" aria-label="Cod_postal" id="cod_postal_magazin_add"
                                          maxlength="100" required></textarea>
                                <label for="cod_postal_magazin_add">Cod Postal</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addJudecator">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Programări Add Modal -->

<%--<div class="modal fade" id="comenzi_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"--%>
<%--     aria-labelledby="comenzi_add_modal_label" aria-hidden="true">--%>
<%--    <div class="modal-dialog modal-dialog-centered">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 class="modal-title" id="comenzi_add_modal_label">Adaugă o programare nouă</h5>--%>
<%--                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--            </div>--%>
<%--            <form autocomplete="on" action="Comenzi" method="POST">--%>
<%--                <div class="modal-body">--%>

<%--                    <div class="row g-3">--%>
<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <select type="text" class="form-control" name="ID_Proces_add" aria-label="Proces" id="ID_Proces_add"--%>
<%--                                        required>--%>
<%--                                    <c:forEach var="proces" items="${procesList}">--%>
<%--                                        <option value="${proces.ID_PROCES}">${proces.NUMAR}</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                                <label for="ID_Proces_add">Proces</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <select type="text" class="form-control" name="ID_Judecator_add" aria-label="Judecător" id="ID_Judecator_add"--%>
<%--                                        required>--%>
<%--                                    <c:forEach var="judecator" items="${judecatorList}">--%>
<%--                                        <option value="${judecator.ID_JUDECATOR}">${judecator.PRENUME} ${judecator.NUME} (${judecator.CNP})</option>--%>
<%--                                    </c:forEach>--%>
<%--                                </select>--%>
<%--                                <label for="ID_Judecator_add">Judecător</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="text" class="form-control" name="Oras_add" placeholder="Oraș" aria-label="Oraș" id="Oras_add"--%>
<%--                                       maxlength="20" pattern="[A-Z]{1}.*" required>--%>
<%--                                <label for="Oras_add">Oraș</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="text" class="form-control" name="Locatie_add" placeholder="Locație" aria-label="Locație" id="Locatie_add"--%>
<%--                                       maxlength="50" pattern="[A-Z]{1}.*" required>--%>
<%--                                <label for="Locatie_add">Locație</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-12">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="text" class="form-control" name="Sala_add" placeholder="Sala" aria-label="Sala" id="Sala_add"--%>
<%--                                       maxlength="10" pattern="\d+[A-Z]*" required>--%>
<%--                                <label for="Sala_add">Sala</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-md-6">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="date" class="form-control" name="Data_add" placeholder="Data" aria-label="Data" id="Data_add" required>--%>
<%--                                <label for="Data_add">Data</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>

<%--                        <div class="col-md-6">--%>
<%--                            <div class="form-floating">--%>
<%--                                <input type="time" class="form-control" name="Ora_add" placeholder="Ora" aria-label="Ora" id="Ora_add" required>--%>
<%--                                <label for="Ora_add">Ora</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>


<%--                </div>--%>
<%--                <div class="modal-footer">--%>
<%--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>--%>
<%--                    <button type="submit" class="btn btn-primary" name="addProgramare">Adaugă</button>--%>
<%--                </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>







<h1>
    <%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
</body>
</html>