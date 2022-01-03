<%@ page import="DAOImplement.ClientDAOImplement" %>
<%@ page import="DAOImplement.MagazinDAOImplement" %>
<%@ page import="JavaBean.Client" %>
<%@ page import="java.util.List" %>
<%@ page import="JavaBean.Magazin" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Interfață Clienți - Magazine</title>
    <link rel="stylesheet" href="static/index/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Armata&amp;display=swap">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Kalam&amp;display=swap">
    <link rel="stylesheet" href="static/index/assets/css/styles.css">

</head>

<body>

<%
    ClientDAOImplement clientDAO = new ClientDAOImplement();
    List<Client> clientList = clientDAO.displayClienti();

    MagazinDAOImplement magazinDAO = new MagazinDAOImplement();
    List<Magazin> magazinList = magazinDAO.displayMagazine();

    request.setAttribute("clientList", clientList);
    request.setAttribute("magazinList", magazinList);
%>

<section style="font-family: Armata, sans-serif;color: var(--bs-gray-400);">
    <div class="container-fluid" style="background: #000000;margin-left: Auto;margin-right: Auto;padding-top: 30px;">
        <h2 class="d-xxl-flex"
            style="padding-top: 10px;padding-right: 34px;padding-left: 34px;font-family: Kalam, serif;"><br><strong>Interfață
            Clienți - Magazine</strong><br></h2>
        <p class="d-xxl-flex" style="padding-right: 34px;padding-left: 34px;">Relaționarea dintre Clienții unor magazine
            printr-o tabelă de legătura - Comenzi<br><br></p>
        <div class="row d-xxl-flex justify-content-xxl-center"
             style="padding-right: 40px;padding-left: 40px;padding-bottom: 40px;height: 1000px;">
            <div class="col-xl-3 col-xxl-3 offset-xl-1"
                 style="background: #212529;color: #efedef;padding: 10px;height: 330px;width: 360.75px;">
                <div style="padding: 12px;padding-bottom: 24px;">
                    <h2 class="text-center d-xxl-flex" style="padding-top: 10px;font-family: Kalam, serif;"><br><strong>Clienți</strong>
                    </h2>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <form role="form" action="Clienti" method="get">
                        <input type="submit" class="btn btn-primary btn-lg text-center"
                               name="displayClienti" value="Afișare Clienți" style="width: 298px;">
                    </form>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <button class="btn btn-primary btn-lg text-center d-xl-flex align-items-xl-start" type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#clienti_add_modal" style="width: 298px;">Adăugare Client nou
                    </button>
                </div>
            </div>
            <div class="col-xl-3 col-xxl-3"
                 style="color: #efedef;padding: 10px;background: #343a40;height: 330px;width: 360.75px;">
                <div style="padding: 12px;padding-bottom: 24px;">
                    <h2 class="text-center d-xxl-flex" style="padding-top: 10px;font-family: Kalam, serif;"><br><strong>Magazine</strong><br>
                    </h2>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <form role="form" action="Magazine" method="get">
                        <input type="submit" class="btn btn-primary btn-lg text-center"
                            name="displayMagazine" value="Afișare Magazine" style="width: 298px;">
                    </form>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <button class="btn btn-primary btn-lg text-center d-xl-flex align-items-xl-start" type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#magazine_add_modal" style="width: 298px;">Adăugare Magazin nou
                    </button>
                </div>
            </div>
            <div class="col-xl-3 col-xxl-3"
                 style="background: #212529;color: #efedef;padding: 10px;height: 330px;width: 360.75px;">
                <div style="padding: 12px;padding-bottom: 24px;">
                    <h2 class="text-center d-xxl-flex" style="padding-top: 10px;font-family: Kalam, serif;"><br><strong>Comenzi</strong>
                    </h2>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <form role="form" action="Comenzi" method="get">
                          <input type="submit" class="btn btn-primary btn-lg text-center"
                            name="displayComenzi" value="Afișare Comenzi" style="width: 298px;">
                    </form>
                </div>
                <div style="padding: 12px;padding-bottom: 24px;">
                    <button class="btn btn-primary btn-lg text-center d-xl-flex align-items-xl-start" type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#comenzi_add_modal" style="width: 298px;">Adăugare Comandă nouă
                    </button>
                </div>
            </div>
        </div>
    </div>
</section>

<%-- Clienti Add Modal --%>

<div class="modal fade" id="clienti_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="clienti_add_modal_label" aria-hidden="true">
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
                    <button type="submit" class="btn btn-primary" name="addClient">Adaugă</button>
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
                                <input type="text" class="form-control" name="NUME_MAGAZIN_add" placeholder="Nume Magazin" aria-label="Nume Magazin" id="NUME_MAGAZIN_add"
                                       maxlength="50" autocomplete="given-name" required>
                                <label for="NUME_MAGAZIN_add">Nume Magazin</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="TELEFON_MAGAZIN_add" placeholder="Telefon" aria-label="Telefon" id="TELEFON_MAGAZIN_add"
                                          maxlength="100" required></textarea>
                                <label for="TELEFON_MAGAZIN_add">Telefon</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="EMAIL_MAGAZIN_add" placeholder="Email" aria-label="Email" id="EMAIL_MAGAZIN_add"
                                          maxlength="100" required></textarea>
                                <label for="EMAIL_MAGAZIN_add">Email</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="ORAS_MAGAZIN_add" placeholder="Oras" aria-label="Oras" id="ORAS_MAGAZIN_add"
                                          maxlength="100" required></textarea>
                                <label for="ORAS_MAGAZIN_add">Oras</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="ADRESA_MAGAZIN_add" placeholder="Adresa" aria-label="Adresa" id="ADRESA_MAGAZIN_add"
                                          maxlength="100" required></textarea>
                                <label for="ADRESA_MAGAZIN_add">Adresa</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <textarea type="text" class="form-control" name="COD_POSTAL_MAGAZIN_add" placeholder="Cod_postal" aria-label="Cod_postal" id="COD_POSTAL_MAGAZIN_add"
                                          maxlength="100" required></textarea>
                                <label for="COD_POSTAL_MAGAZIN_add">Cod Postal</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addMagazin">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%-- Comenzi add modal --%>

<div class="modal fade" id="comenzi_add_modal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="comenzi_add_modal_label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="comenzi_add_modal_label">Adaugă o comandă</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form autocomplete="on" action="Comenzi" method="POST">
                <div class="modal-body">

                    <div class="row g-3">
                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="IDMAGAZIN_add" aria-label="MAGAZIN" id="IDMAGAZIN_add" required>
                                    <%--@elvariable id="magazinList" type="java.util.List"--%>
                                    <c:forEach items="${magazinList}" var="magazin">
                                        <option value="${magazin.IDMAGAZIN}">${magazin.NUME_MAGAZIN} (${magazin.ORAS})</option>
                                    </c:forEach>
                                </select>
                                <label for="IDMAGAZIN_add">Magazin</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="IDCLIENT_add" aria-label="CLIENT" id="IDCLIENT_add" required>
                                    <%--@elvariable id="clientList" type="java.util.List"--%>
                                    <c:forEach items="${clientList}" var="client">
                                        <option value="${client.IDCLIENT}">${client.PRENUME} ${client.NUME} (${client.CNP})</option>
                                    </c:forEach>
                                </select>
                                <label for="IDCLIENT_add">Client</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <select type="text" class="form-control" name="STATUS_COMANDA_add" aria-label="STATUS_COMANDA" id="STATUS_COMANDA_add" required>
                                    <option value="Anulată"> Anulată </option>
                                    <option value="Livrată"> Livrată </option>
                                    <option value="În așteptare"> În așteptare </option>
                                    <option value="Returnată"> Returnată </option>
                                </select>
                                <label for="STATUS_COMANDA_add">Status Comandă</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="DATA_PLASARII_add" placeholder="DATA_PLASARII" aria-label="DATA_PLASARII" id="DATA_PLASARII_add"
                                       maxlength="50" required>
                                <label for="DATA_PLASARII_add">Data plasării</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="time" class="form-control" name="ORA_PLASARII_add" placeholder="ORA_PLASARII" aria-label="ORA_PLASARII" id="ORA_PLASARII_add" required>
                                <label for="ORA_PLASARII_add">Ora plasării</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <div class="form-floating">
                                <input type="date" class="form-control" name="DATA_LIVRARII_add" placeholder="DATA_LIVRARII" aria-label="DATA_LIVRARII" id="DATA_LIVRARII_add" maxlength="50">
                                <label for="DATA_LIVRARII_add">Data livrării</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <input type="time" class="form-control" name="ORA_LIVRARII_add" placeholder="ORA_LIVRARII" aria-label="ORA_LIVRARII" id="ORA_LIVRARII_add">
                                <label for="ORA_LIVRARII_add">Ora livrării</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Închide</button>
                    <button type="submit" class="btn btn-primary" name="addComanda">Adaugă</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="static/index/assets/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>