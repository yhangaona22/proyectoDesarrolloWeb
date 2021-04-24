<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>     
        <title>JSP Page</title>
    </head>
    <body style="margin-top: 30px">      
        <%
            //CONECTANOD A LA BASE DE DATOS:
            Connection con;
            String url = "jdbc:mysql://localhost:3306/bd_practica";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            //Emnpezamos Listando los Datos de la Tabla Usuario
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from usuario");
            //Creamo la Tabla:     
        %>
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Agregar</button>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" value="Buscar"/>                            
            </div>
        </div>  
              
        <br>
        <div class="container">               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
             <table class="table table-bordered"  id="tablaDatos">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">Nombres</th>
                            <th class="text-center">Apellido Pat.</th>
                            <th class="text-center">Apellido Mat.</th>
                            <th class="text-center">Fecha de Nac.</th>
                            <th class="text-center">Edad</th>
                            <th class="text-center">Sexo</th>
                            <th class="text-center">Departamento</th>
                            <th class="text-center">Provincia</th>
                            <th class="text-center">Distrito</th>
                            <th class="text-center">Correo</th>
                            <th class="text-center">Telefono 1</th>
                            <th class="text-center">Telefono 2</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                        <%
                            while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center"><%= rs.getInt("Id_Usuario")%></td>
                            <td class="text-center"><%= rs.getString("DNI")%></td>
                            <td class="text-center"><%= rs.getString("Nombres")%></td>
                            <td class="text-center"><%= rs.getString("Apellido_Paterno")%></td>
                            <td class="text-center"><%= rs.getString("Apellido_Materno")%></td>
                            <td class="text-center"><%= rs.getString("Fecha_Nacimiento")%></td>
                            <td class="text-center"><%= rs.getString("Edad")%></td>
                            <td class="text-center"><%= rs.getString("Sexo")%></td>
                            <td class="text-center"><%= rs.getString("Departamento")%></td>
                            <td class="text-center"><%= rs.getString("Provincia")%></td>
                            <td class="text-center"><%= rs.getString("Distrito")%></td>
                            <td class="text-center"><%= rs.getString("Correo")%></td>
                            <td class="text-center"><%= rs.getString("Telefono1")%></td>
                            <td class="text-center"><%= rs.getString("Telefono2")%></td>
                            <td class="text-center">
                                
                                <!-- <input type="hidden" value="<//%= rs.getInt("Id_Usuario")%>" id="Editar"/>
                                <input type="submit" class="btn btn-warning" data-toggle="modal" data-target="#myModal1" value="Editar"/>  -->
                                <a href="Editar.jsp?id=<%= rs.getInt("Id_Usuario")%>" class="btn btn-primary">Editar</a>
                                <a href="Delete.jsp?id=<%= rs.getInt("Id_Usuario")%>" class="btn btn-danger">Delete</a>
                            </td>
                        </tr>
                        <%}%>
                </table>
            </div>        
        <div class="container">          
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="z-index: 9999; height: 500px">
                    <div class="modal-content">
                        <div class="modal-header">                            
                            <h4 class="modal-title" id="myModalLabel">Agregar Registro</h4>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post">
                                <label>DNI:</label> 
                                <input type="text" name="txtDNI" class="form-control"/>                                      
                                <label>Nombres:</label> 
                                <input type="text" name="txtNom" class="form-control"/><br>
                                <label>Apellido Pat.:</label> 
                                <input type="text" name="txtApePat" class="form-control"/><br>
                                <label>Apellido Mat.:</label> 
                                <input type="text" name="txtApeMat" class="form-control"/><br>
                                <label>Fecha Nac.:</label> 
                                <input type="text" name="txtFeNac" class="form-control"/><br>
                                <label>Edad:</label> 
                                <input type="text" name="txtEdad" class="form-control"/><br>
                                <label>Sexo:</label> 
                                <input type="text" name="txtSexo" class="form-control"/><br>
                                <label>Departamento:</label> 
                                <input type="text" name="txtDepart" class="form-control"/><br>
                                <label>Provincia:</label> 
                                <input type="text" name="txtProvin" class="form-control"/><br>
                                <label>Distrito:</label> 
                                <input type="text" name="txtDistri" class="form-control"/><br>
                                <label>Correo:</label> 
                                <input type="text" name="txtCorreo" class="form-control"/><br>
                                <label>Telefono 1:</label> 
                                <input type="text" name="txtTelef1" class="form-control"/><br>
                                <label>Telefono 2:</label> 
                                <input type="text" name="txtTelef2" class="form-control"/><br>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>                            
                                    <input type="submit" value="Guardar" class="btn btn-primary"/>
                                </div>
                            </form>
                        </div>
                    </div>                    
                </div>
            </div>
            <%
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
                if (nom != null && dni != null) {
                    ps = con.prepareStatement("insert into usuario(DNI,Nombres,Apellido_Paterno,Apellido_Materno,Fecha_Nacimiento,Edad,Sexo,Departamento,Provincia,Distrito,Correo,Telefono1,Telefono2)values('"+dni+"','"+nom+"','"+apepat+"','"+apemat+"','"+fenac+"','"+edad+"','"+sexo+"','"+depart+"','"+provin+"','"+distri+"','"+correo+"','"+telef1+"','"+telef2+"')");
                    ps.executeUpdate();
                    response.sendRedirect("index.jsp");

                }
            %>
        </div>        
        <script src="js/jquery.js" type="text/javascript"></script>             
        <script src="js/bootstrap.min.js" type="text/javascript"></script>        
    </body>
</html>
