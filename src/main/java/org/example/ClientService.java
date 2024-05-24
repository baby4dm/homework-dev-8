package org.example;

import lombok.*;

import java.sql.*;
import java.util.*;

public class ClientService {
    private static final String CREATE_STATEMENT = "INSERT INTO client (name) VALUES (?)";
    private static final String FIND_BY_ID_QUERY = "SELECT name FROM client WHERE id = ?;";
    private static final String UPDATE_QUERY = "UPDATE client SET name = ? WHERE id = ?;";
    private static final String DELETE_QUERY = "DELETE FROM client WHERE id = ?;";
    private static final String GET_ALL_QUERY = "SELECT * FROM client;";
    @SneakyThrows
    public int create(String name){
        validateName(name);
        PreparedStatement preparedStatement = DataSource.getInstance().getConnection().prepareStatement(CREATE_STATEMENT, PreparedStatement.RETURN_GENERATED_KEYS);
        preparedStatement.setString(1, name);
        preparedStatement.executeUpdate();
        ResultSet resultSet = preparedStatement.getGeneratedKeys();
        int key = -1;
        if (resultSet.next()){
            key = resultSet.getObject(1, Integer.class);
        }
        return key;
    }

    @SneakyThrows
    public String getById(int id) {
        validateId(id);
        PreparedStatement preparedStatement = DataSource.getInstance().getConnection().prepareStatement(FIND_BY_ID_QUERY);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()){
            return resultSet.getString("name");
        }
        throw new RuntimeException("Client was not founded");
    }

    @SneakyThrows
    void setName(int id, String name){
        validateId(id);
        validateName(name);
        PreparedStatement preparedStatement = DataSource.getInstance().getConnection().prepareStatement(UPDATE_QUERY);
        preparedStatement.setString(1, name);
        preparedStatement.setInt(2, id);
        preparedStatement.executeUpdate();
    }

    @SneakyThrows
    void deleteById(int id){
        validateId(id);
        PreparedStatement preparedStatement = DataSource.getInstance().getConnection().prepareStatement(DELETE_QUERY);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
    }

    @SneakyThrows
    List<Client> listAll(){
        PreparedStatement preparedStatement = DataSource.getInstance().getConnection().prepareStatement(GET_ALL_QUERY, PreparedStatement.RETURN_GENERATED_KEYS);
        List<Client> clients = new ArrayList<>();
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()){
            Client client = new Client();
            client.setId(resultSet.getInt(1));
            client.setName(resultSet.getString(2));
            clients.add(client);
        }
        return clients;
    }

    private void validateId(int id){
        if (id < 0){
            throw new RuntimeException("Id should be positive");
        }
    }

    private void validateName(String name){
        Objects.requireNonNull(name);
        if (name.length() > 255 || name.isEmpty()){
            throw new RuntimeException("Name length should be smaller or equal 255");
        }
    }
}
