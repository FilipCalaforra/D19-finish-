package GUI.Controller;


import Domain.Accounts.CanteenEmploy;
import Domain.Accounts.EccoEmploy;
import Domain.Accounts.IDCard;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

import java.io.IOException;
import java.util.ArrayList;

public class FXMLBalanceController extends AbstractController{
    /*----------------------------------------All FXML Button, Field, RadioButton,Label Declaration-----------------------*/

    @FXML private TextField amountTextField, CardIDNo, CardIDNo2, CardIDHis1;
    @FXML private Button btnOK, BtnViewBalance, btnMainMenu;

    /*----------------------------------------All FXML Button, Field, RadioButton,Label Declaration-----------------------*/
    //OBJECTS
    IDCard IC = new IDCard();
    //
    @FXML
    void handleAddBalance(ActionEvent event) {
        try {
            IC.set_IDCARD(Integer.parseInt((CardIDNo.getText())));
            IC.set_NEWBALANCE(Integer.parseInt(amountTextField.getText()));
            IC.getBalanceDB();
            IC.updateBalanceDB();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    @FXML
    void handleViewBalance(ActionEvent event) {
        try {
            IC.set_IDCARD(Integer.parseInt((CardIDNo2.getText())));
            String Balance = String.valueOf(IC.getBalanceDB());

            System.out.println(IC.getBalanceDB());

            CardIDHis1.setText(Balance);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    @FXML
    void showMainMenu(ActionEvent event) {
        System.out.println("HEJ");
        Stage stage = (Stage) btnMainMenu.getScene().getWindow();
        loadscreen(stage, "MainGUI.fxml");
    }
}
