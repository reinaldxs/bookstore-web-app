/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package local.rfs.bookstoreweb.model.dao;

import connection.MySQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import local.rfs.bookstoreweb.model.bean.User;

/**
 *
 * @author devsys-b
 */
public class UserDAO {

    private static final String SQL_INSERT = "INSERT INTO user(email, "
            + "password, fullName) "
            + "VALUES (?, ?, ?)";

    private static final String SQL_SELECT_ALL = "SELECT * FROM user";
    private static final String SQL_SELECT_ID = "SELECT * FROM user WHERE id = ?";
    private static final String SQL_SELECT_FULLNAME = "SELECT fullName FROM user "
            + "WHERE email = ? AND password = ?";

    private static final String SQL_UPDATE = "UPDATE user SET email= ?,"
            + "email = ?, password = ? WHERE id = ?";

    private static final String SQL_DELETE = "DELETE FROM user WHERE id = ?";

    /**
     * Insere um usuario na base de dados User
     *
     * @param u
     */
    public void create(User u) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, u.getEmail());
            stmt.setString(2, u.getPassword());
            stmt.setString(3, u.getFullName());

            //Executa a query
            int auxRetorno = stmt.executeUpdate();

            Logger.getLogger(UserDAO.class.getName()).log(Level.INFO,
                    "Inclusao: {0}", auxRetorno);

        } catch (SQLException sQLException) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {
            //Encerra a conexão com o banco e o statement.
            MySQLConnection.closeConnection(conn, stmt);
        }
    }

    /**
     * Retorna todos os registro da tabela produto
     *
     * @return
     */
    public List<User> getResults() {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        User p = null;
        List<User> listaUsers = null;

        try {
            //Prepara a string de SELECT e executa a query.
            stmt = conn.prepareStatement(SQL_SELECT_ALL);
            rs = stmt.executeQuery();

            //Carrega os dados do resultSet rs, converte em User e
            //adiciona na lista de retorno 
            listaUsers = new ArrayList<>();

            while (rs.next()) {
                p = new User();
                p.setId(rs.getInt("id"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setFullName(rs.getString("fullName"));
                listaUsers.add(p);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaUsers;
    }

    /**
     * Retorna um produto da tabela produto
     *
     * @param id IDentificação do User
     * @return
     */
    public User getResultById(int id) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        User b = null;

        try {
            stmt = conn.prepareStatement(SQL_SELECT_ID);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();

            if (rs.next()) {
                b = new User();
                b.setId(rs.getInt("id"));
                b.setEmail(rs.getString("email"));
                b.setPassword(rs.getString("password"));
                b.setFullName(rs.getString("fullName"));

            }
        } catch (SQLException sQLException) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {

            MySQLConnection.closeConnection(conn, stmt, rs);
        }
        return b;
    }

    /**
     * Atualiza um registro na tabela produto.
     *
     * @param b User a ser atualizado
     */
    public void update(User b) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, b.getEmail());
            stmt.setString(2, b.getPassword());
            stmt.setString(3, b.getFullName());
            stmt.setInt(4, b.getId());

            //Executa a query
            int auxRetorno = stmt.executeUpdate();

            Logger.getLogger(UserDAO.class.getName()).log(Level.INFO, null,
                    "Update: " + auxRetorno);

        } catch (SQLException sQLException) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {
            //Encerra a conexão com o banco e o statement0
            MySQLConnection.closeConnection(conn, stmt);
        }
    }

    /**
     * Exclui um produto com base do ID fornecido
     *
     * @param id IDentificaçãodo produto
     */
    public void delete(int id) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;

        try {
            stmt = conn.prepareStatement(SQL_DELETE);
            stmt.setInt(1, id);

            //Executa a query
            int auxRetorno = stmt.executeUpdate();

            Logger.getLogger(UserDAO.class.getName()).log(Level.INFO, null,
                    "Delete: " + auxRetorno);
        } catch (SQLException sQLException) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {
            //Encerra a conexão com o banco e o statement.
            MySQLConnection.closeConnection(conn, stmt);
        }
    }

    //----------------------ULTIMO METODO ADICIONADO------------------------
    public User checkLogin(String email, String password) {
        Connection conn = MySQLConnection.getConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        User u = null;

        try {
            //Prepara a string de SELECT e executa a q
            stmt = conn.prepareStatement(SQL_SELECT_FULLNAME);
            stmt.setString(1, email);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));

            }

        } catch (SQLException sQLException) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null,
                    sQLException);
        } finally {
            //Encerra a conexão com o banco e o statement
            MySQLConnection.closeConnection(conn, stmt);
        }

        return u;
    }
}
