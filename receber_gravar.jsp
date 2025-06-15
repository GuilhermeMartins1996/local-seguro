
<%@page language="java" import="java.sql.*"%>
<%@page language="java" contentType="text/html charset=UTF-8"%>


<%
    //criar as variaveis e armazenar as informações digitadas pelo usuario
    String vnome = request.getParameter("nome");
    String vEmail = request.getParameter("email");
    String vTelefone = request.getParameter("telefone");
    String vEndereco = request.getParameter("endereco");
    double vSalario = Double.parseDouble(request.getParameter("salario"));
    String vObservacao = request.getParameter("observacao");

    //criar as variaveis para acessar o banco de dados
    String database = "projeto";
    String endereco = "jdbc:mysql://localhost:3306/" + database ;
    String usuario = "root";
    String senha = "";

    //Driver é quase um motorista do aparelho ou programa, transportar os dados sobre o equip ou o programa
    String driver = "com.mysql.jdbc.Driver";

    //carregar o driver na memoria
    Class.forName(driver);

    //criar a variavel para conectar com o banco de dados
    Connection conexao ;

    //Abrir conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco,usuario,senha);

    //criar comando para inserir no banco de dados
    String sql = "INSERT INTO receber (nome ,email,telefone,endereco,salario,observacao) VALUES (?,?,?,?,?,?)";
    PreparedStatement stm = conexao.prepareStatement(sql);
    
    //trocar pelas informações digitadas pelo usuario
    stm.setString(1,vnome);
    stm.setString(2,vEmail);
    stm.setString(3,vTelefone);
    stm.setString(4,vEndereco);
    stm.setDouble(5,vSalario);
    stm.setString(6,vObservacao);

    stm.execute();
    stm.close();
    out.print("<h3> Dados Gravados com Sucesso !!!");
    out.print("<br><br>");
    out.print("<a href='receber.html'> Voltar </a>");

%>