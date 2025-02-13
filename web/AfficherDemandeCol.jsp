<%-- 
    Document   : AfficherDemandeInd
    Created on : 1 janv. 2020, 00:10:09
    Author     : singleton
--%>

<%@page import="dao.dataAccess"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="dbutil.JavaConnect"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!doctype html>

<html class="no-js" lang="">


    <head>
        <meta charset="ISO-8859-1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Afficher les Demandes Collectives </title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="favicon.ico">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/transitions.css">
        <link rel="stylesheet" href="css/prettyPhoto.css">
        <link rel="stylesheet" href="css/owl.carousel.css">
        <link rel="stylesheet" href="css/pogoslider.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="css/color.css">
        <link rel="stylesheet" href="css/responsive.css">
        <script src="js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #f2f2f2}
        </style>
    </head>

    <body>
        <%
            String formulaire_id = (String) request.getAttribute("formulaire_id");

            String ix = request.getParameter("id");
            String idx = (String) request.getAttribute("id");
            String tpe = (String) request.getAttribute("tpe");
            if (idx == null) {
                idx = ix;
            }
            //ix = "1";
            String sql = "SELECT * FROM loginadmin where Id=?";
            Connection con = new JavaConnect().createConnection();
            PreparedStatement pst, pst1;
            try {

                // String idx = "0";
                pst = con.prepareStatement(sql);
                pst.setString(1, ix);
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    System.out.println("hello 5");
                    String id = rs.getString(1);
                    String Prenom = rs.getString(2);
                    String nom = rs.getString(3);
                    String Civilite = rs.getString(4);
        %>    <!--************************************
                            Loader Start
            *************************************-->
        <div class="lds-roller">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
        <!--************************************
                            Loader End
            *************************************-->
        <!--************************************
                            Wrapper Start
            *************************************-->
        <div id="at-wrapper" class="at-wrapper">
            <!--************************************
                                    Header Start
                    *************************************-->
            <header id="at-header" class="at-header at-headervthree">
                <div class="container-fluid">
                    <div class="row">
                        <strong class="at-logo"><a href="index.html"><img src="images/logo2.png" alt="company logo here"></a></strong>
                        <div class="at-navigationarea">
                            <nav id="at-nav" class="at-nav">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#at-navigation" aria-expanded="false">
                                        <span class="sr-only">Toggle navigation</span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                </div>
                                <div id="at-navigation" class="collapse navbar-collapse at-navigation">
                                    <ul>
                                        <li class="menu-item-has-children">
                                            <a href="index.html">Accueil</a>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="Principal.jsp?id=<%=ix%>">Menu Admin</a>
                                        </li>
                                        <li class="menu-item-has-children">
                                            <a href="connection.html">Se d�connecter</a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                            <div class="at-contactsocial">
                                <span class="at-contactnumber">
                                    <i class="icon-telephone114"></i>
                                    <em>+00221 33 837 80 09</em>
                                </span>
                              <!--  <ul class="at-socialicons">
                                    <li class="at-facebook"><a href="https://www.facebook.com/badel"><i class="fa fa-facebook"></i></a></li>
                                    <li class="at-twitter"><a href="https://www.twitter.com/badel"><i class="fa fa-twitter"></i></a></li>
                                    <li class="at-instagram"><a href="https://www.youtube.com/badel"><i class="fa fa-youtube"></i></a></li>
                                </ul> -->
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!--************************************
                                    Header End
                    *************************************-->
            <main id="at-main" class="at-main at-haslayout">

                <div class="clearfix"></div>
                <section class="at-sectionspace at-haslayout">
                    <div class="container">
                        <h1 style="text-align: center;">Liste des Demandes Collectives</h1>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="at-content">
                                    <div class="at-contactusvone">
                                        <div style="overflow-x:auto;">
                                            <table>
                                                <thead>
                                                    <tr>
                                                       <th>Option</th>
                                                        <th>N�</th>
                                                        <th>Inscrit_Par</th>
                                                        <th>Formulaire</th>
                                                        <th>Pr�nom Repr�sentant</th>
                                                        <th>Nom Repr�sentant</th>
                                                        <th>Sexe R�pr�sentant</th>
                                                        <th>Adresse Repr�sentant</th>
                                                        <th>Contact1 Repr�sentant</th>
                                                        <th>Contact2 Repr�sentant</th>
                                                        <th>Titre</th>
                                                        <th>Nature Juridique</th>
                                                        <th>D�nomination</th>
                                                        <th>Reconnaisance Juridique</th>
                                                        <th>Lieu Collectif</th>
                                                        <th>Pays Ext�rieur</th>
                                                        <th>R�gion Ext�rieure</th>
                                                        <th>D�partement Ext�rieur</th>
                                                        <th>Commune Ext�rieure</th>
                                                        <th>Quartier Village Ext�rieur</th>
                                                        <th>R�gion Int�rieure</th>
                                                        <th>D�partement Int�rieur</th>
                                                        <th>Commune Int�rieure</th>
                                                        <th>Quartier Village Int�rieur</th>                                                        
                                                        <th>Date Creation</th>
                                                        <th>Total Membre</th>
                                                        <th>Total homme</th>
                                                        <th>Total femme</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <%

                                                        String sql1 = "SELECT * FROM p1demandeurcollectif where supp = 0";
                                                        try {

                                                            // String idx = "0";
                                                            pst = con.prepareStatement(sql1);
                                                            ResultSet rs1 = pst.executeQuery();

                                                            int compte = 1;
                                                            while (rs1.next()) {
                                                    %>         
                                                    <tr>
                                                        <td><input style="background-color: #09b83e; color: white" type="button" value=" Ouvrir Dossier " onclick="location.href = 'dossierComplet.jsp?idform=<%=rs1.getString(2)%>&type=col&id=<%=ix%>'"/> </td>
                                                        <td><%=compte%> </td>
                                                        <td>User <%=rs1.getString(27)%></td>
                                                        <td><%=rs1.getString(2)%></td>
                                                        <td><%=rs1.getString(3)%></td>
                                                        <td><%=rs1.getString(4)%></td>
                                                        <td><%=rs1.getString(5)%></td>
                                                        <td><%=rs1.getString(6)%></td>
                                                        <td><%=rs1.getString(7)%></td>
                                                        <td><%=rs1.getString(8)%></td>
                                                        <td><%=rs1.getString(9)%></td>
                                                        <td><%=rs1.getString(10)%></td>
                                                        <td><%=rs1.getString(11)%></td>
                                                        <td><%=rs1.getString(12)%></td>
                                                        <td><%=rs1.getString(13)%></td>
                                                        <td><%=rs1.getString(14)%></td>
                                                        <td><%=rs1.getString(15)%></td>
                                                        <td><%=rs1.getString(16)%></td>
                                                        <td><%=rs1.getString(17)%></td>
                                                        <td><%=rs1.getString(18)%></td>
                                                        <td><%=rs1.getString(19)%></td>
                                                        <td><%=rs1.getString(20)%></td>
                                                        <td><%=rs1.getString(21)%></td>
                                                        <td><%=rs1.getString(22)%></td>
                                                        <td><%=rs1.getString(23)%></td>
                                                        <td><%=rs1.getString(24)%></td>
                                                        <td><%=rs1.getString(25)%></td>
                                                        <td><%=rs1.getString(26)%></td>
                                                        <%
                                                                    compte++;
                                                                }
                                                            } catch (SQLException ex) {
                                                                System.out.println("Erreur recup ind1" + ex);
                                                            }

                                                        %>

                                                </tbody>
                                            </table>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            </section>
                            </main>

                            <!--************************************
                                                    Footer Start
                                    *************************************-->
                            <footer id="at-footer" class="at-footer at-haslayout">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <div class="at-emailsubscribearea">
                                                <p>Recevez nos derni�res informations</p>
                                                <form class="at-formtheme at-formnewsletter">
                                                    <fieldset>
                                                        <input type="email" name="email" class="form-control" placeholder="Votre adresse e-mail">
                                                        <button class="at-btn" type="submit">Souscrire</button>
                                                    </fieldset>
                                                </form>
                                            </div>
                                            <div class="at-threecolumns">
                                                <div class="at-fcolumn">
                                                    <div class="at-widget at-widgettext">
                                                        <strong class="at-logo"><a href="javascript:void(0);"><img src="images/logof.png" alt="image description"></a></strong>
                                                        <!--     <div class="at-description">
                                                                 <p>Lorem ipsum dolor sit amet, consectetur adi pisi cing elit, sed do eiusmod tempor Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, the consectetur.</p>
                                                             </div> -->
                                                        <ul class="at-socialicons">
                                                            <li class="at-facebook"><a href="www.facebook.com/taataan"><i class="fa fa-facebook"></i></a></li>
                                                            <li class="at-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                            <li class="at-instagram"><a href="www.youtube.com/taataan"><i class="fa fa-youtube"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="at-fcolumn">
                                                    <div class="at-widget at-widgetusefullinks">
                                                        <div class="at-fwidgettitle">
                                                            <h3>Liens Utiles</h3>
                                                        </div>
                                                        <div class="at-widgetcontent">
                                                            <ul>
                                                                <li><a href="index.html">Accueil</a></li>
                                                                <li><a href="javascript:void(0);">S'INSCRIRE</a></li>
                                                                <li><a href="https://www.adel-invest.com">Adel-invest</a></li>
                                                                <li><a href="https://www.taataan.sn">Taataan</a></li>
                                                                <li><p>Email: contact@taataan.sn</p></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="at-fcolumn">
                                                    <div class="at-widget">
                                                        <!--  <div class="at-emailsubscribearea">
                                <p>Recevez nos derni�res informations</p>
                                <form class="at-formtheme at-formnewsletter">
                                    <fieldset>
                                        <input type="email" name="email" class="form-control" placeholder="Votre adresse e-mail">
                                        <button class="at-btn" type="submit">Souscrire</button>
                                    </fieldset>
                                </form>
                            </div> 
                          -->
                           <!--    <div class="at-threecolumns">
                                <div class="at-fcolumn">
                                    <div class="at-widget at-widgettext">
                                        <strong class="at-logo"><a href="javascript:void(0);"><img src="images/logof.png" alt="image description"></a></strong>
                                          <div class="at-description">
                                                <p>Lorem ipsum dolor sit amet, consectetur adi pisi cing elit, sed do eiusmod tempor Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, the consectetur.</p>
                                            </div> 
                                        <ul class="at-socialicons">
                                            <li class="at-facebook"><a href="www.facebook.com/taataan"><i class="fa fa-facebook"></i></a></li>
                                            <li class="at-twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                                            <li class="at-instagram"><a href="www.youtube.com/taataan"><i class="fa fa-youtube"></i></a></li>
                                        </ul>
                                       
                                    </div>
                                </div>
                                <div class="at-fcolumn">
                                    <div class="at-widget at-widgetusefullinks">
                                        <div class="at-fwidgettitle">
                                            <h3>Liens Utiles</h3>
                                        </div>
                                        <div class="at-widgetcontent">
                                            <ul>
                                                <li><a href="https://www.adel-invest.com">Adel-invest</a></li>
                                                <li><a href="https://www.taataan.sn">Taataan</a></li>
                                                <li>
                                                    <p>Email: contact@taataan.sn</p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div> 
                              <div class="at-fcolumn">
                                    <div class="at-widget">
                                        <div class="at-fwidgettitle">
                                            <h3>Recent News</h3>
                                        </div>
                                        <div class="at-widgetcontent">
                                          <ul>
                                                <li>
                                                       <p>Product Design &amp; Branding Innovative Brand Design Concepts</p> 
                                                    <time datetime="2018-01-12">January 28, 2018</time>
                                                </li>
                                                <li>
                                                      <p>Product Design &amp; Branding Innovative Brand Design Concepts</p> 
                                                    <time datetime="2020-24-11">Novembre 24, 2020</time>
                                                </li>
                                            </ul> 
                                        </div>
                                    </div> -->
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="at-copyright">
                                                <p>Adresse: ZAC MBAO villa N?3 4i&egrave;me Etage Cit&eacute; Socidak 1 en face Brioche Dor&eacute;e, Rufisque Ouvert de 09H &agrave; 17H</p>
                                                <p>Copyright @ 2020. <a href="javascript:void(0);">Badel</a> All rights reserved.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </footer>
                            <!--************************************
                                                    Footer End
                                    *************************************-->
                            <%                                }
                            } catch (SQLException ex) {%>

                            <main id="at-main" class="at-main at-haslayout">

                                <div class="clearfix"></div>
                                <section class="at-sectionspace at-haslayout">
                                    <div class="container">
                                        <h1 style="text-align: center;">Erreur id Conect1</h1>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                <div class="at-content">
                                                    <div class="at-contactusvone">

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </main>
                            <%
                                }
                                con.close();
                                System.out.println("Connection Closed");
                            %>
                        </div>
                        <!--************************************
                                            Wrapper End
                            *************************************-->
                        <script src="js/vendor/jquery-library.js"></script>
                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcvAXp35fi4q7HXm7vcG9JMtzQbMzjRe8"></script>
                        <script src="js/vendor/jquery-migrate.js"></script>
                        <script src="js/vendor/bootstrap.min.js"></script>
                        <script src="js/owl.carousel.min.js"></script>
                        <script src="js/Chart.bundle.min.js"></script>
                        <script src="js/isotope.pkgd.js"></script>
                        <script src="js/prettyPhoto.js"></script>
                        <script src="js/jquery.vide.js"></script>
                        <script src="js/pogoslider.js"></script>
                        <script src="js/countTo.js"></script>
                        <script src="js/appear.js"></script>
                        <script src="js/gmap3.js"></script>
                        <script src="js/function.js"></script>
                        </body>
                        </html>
