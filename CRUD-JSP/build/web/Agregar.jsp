<%-- 
    Document   : Agregar
    Created on : 02/02/2018, 01:11:48 PM
    Author     : Joel
--%>

<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>  
        <div class="container">
            <h1>Agregar Registro</h1>
            <hr>
            <form action="" method="post" class="form-control" style="width: 500px; height: 400px">
                DNI:
                <input type="text" name="txtDNI" class="form-control"/>
                <br>
                Nombres:
                <input type="text" name="txtNom" class="form-control"/>
                <br>
                Apellido Paterno:
                <input type="text" name="txtApePat" class="form-control"/>
                <br>
                Apellido Paterno:
                <input type="text" name="txtApeMat" class="form-control"/>
                <br>
                Fecha Nac.:
                <input type="text" name="txtFeNac" class="form-control"/>
                <br>
                
                Edad:
                <input type="text" name="txtEdad" class="form-control"/>
                <br>
                Sexo:
                <input type="text" name="txtSexo" class="form-control"/>
                <br>
                Departamento:
                <input type="text" name="txtDepart" class="form-control"/>
                <br>
                Provincia:
                <input type="text" name="txtProvin" class="form-control"/>
                <br>
                Distrito:
                <input type="text" name="txtDistri" class="form-control"/>
                <br>
                Correo:
                <input type="text" name="txtCorreo" class="form-control"/>
                <br>
                Telefono 1:
                <input type="text" name="txtTelef1" class="form-control"/>
                <br>
                Telefono 2:
                <input type="text" name="txtTelef2" class="form-control"/>
                <br>
                
                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                <a href="index.jsp">Regresar</a>
            </form>
        </div>
        
        
    </body>
</html>
<%
       //CONECTANOD A LA BASE DE DATOS:
       Connection con;
       String url="jdbc:mysql://localhost:3306/bd_practica";
       String Driver="com.mysql.jdbc.Driver";
       String user="root";
       String clave="";
       Class.forName(Driver);
       con=DriverManager.getConnection(url,user,clave);
       PreparedStatement ps;
       String dni, nom,apepat,apemat,fenac,edad,sexo,depart,provin,distri,correo,telef1,telef2;
                dni = request.getParameter("txtDNI");
                nom = request.getParameter("txtNom");
                apepat=request.getParameter("txtApePat");
                apemat=request.getParameter("txtApeMat");
                fenac=request.getParameter("txtFeNac");
                edad=request.getParameter("txtEdad");
                sexo=request.getParameter("txtSexo");
                depart=request.getParameter("txtDepart");
                provin=request.getParameter("txtProvin");
                distri=request.getParameter("txtDistri");
                correo=request.getParameter("txtCorreo");
                telef1=request.getParameter("txtTelef1");
                telef2=request.getParameter("txtTelef2");
       if(nom!=null && dni!=null){
           ps = con.prepareStatement("insert into usuario(DNI,Nombres,Apellido_Paterno,Apellido_Materno,Fecha_Nacimiento,Edad,Sexo,Departamento,Provincia,Distrito,Correo,Telefono1,Telefono2)values('"+dni+"','"+nom+"','"+apepat+"','"+apemat+"','"+fenac+"','"+edad+"','"+sexo+"','"+depart+"','"+provin+"','"+distri+"','"+correo+"','"+telef1+"','"+telef2+"')");
           ps.executeUpdate();
           JOptionPane.showMessageDialog(null,"Se Agrego Correctamete");           
           response.sendRedirect("index.jsp");
           
       }
       
       
%>