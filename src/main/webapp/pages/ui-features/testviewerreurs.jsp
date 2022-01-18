<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <div class="content">
            <fieldset>
                <legend>Informations Machine</legend>
                <table border="0">
                    <tr>
                        <td>Référence</td>
                        <td><input id="reference" type="text" name="Code" value=""  required=""/></td>
                    </tr>
                   
                  
                </table>
            </fieldset>


            <fieldset>
                <legend>Liste des machines</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Code <br>
                           
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody id="content">

                    </tbody>
                </table>

            </fieldset>
        </form>            
</body>
</html>