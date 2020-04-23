package GUI.Controller;

import DataBase.DB;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.chart.PieChart;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.BorderPane;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.ResourceBundle;

public class FXMLStatisticsController extends AbstractController implements Initializable {

    @FXML
    BorderPane StatisticView;
    @FXML
    private TableView<ModelTable> productTable;
    @FXML
    private TableColumn<ModelTable, String> ProductList;
    @FXML
    private TableColumn<ModelTable, String> QuantityList;
    @FXML
    private PieChart pieChart;
    @FXML
    ComboBox<String> comboProduct = new ComboBox<>();
    Connection con;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
    //comboProduct.getItems(productTable);
    }

    public  class ModelTable {
        String ProductList;


        public ModelTable() {
            this.ProductList = ProductList;

        }

        public void setProductList(String productList) {
            this.ProductList=productList;
        }

        public String getProduct(String products) {
            return ProductList;
        }

    }
    //ProductList
    public  ArrayList<ModelTable> getAllProducts() throws ClassNotFoundException, SQLException {
        ArrayList<ModelTable> pList = new ArrayList<>();

        try {


            ResultSet rs = con.createStatement().executeQuery("SELECT fldProductName FROM tblStorage");

            while (rs.next()) {
                ModelTable modelTable = new ModelTable();

                modelTable.getProduct(rs.getString("Products"));


                pList.add(modelTable);

            }

        } catch (Exception e) {
            System.out.println("error");
            e.printStackTrace();
        }
        System.out.println(pList);
        return (pList);
    }
    @FXML
    void  Refresh(ActionEvent event) throws SQLException, ClassNotFoundException {
        getAllProducts();
        System.out.println("Done");
    }






}


