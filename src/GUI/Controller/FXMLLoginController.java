package GUI.Controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import DataBase.DB;
public class FXMLLoginController extends AbstractController implements Initializable
{
    @FXML
    private Label info1;

    @FXML
    private TextField usernameTextfield;

    @FXML
    private PasswordField passwordTextfield;

    @FXML
    private Button loginBtn;
    @FXML
    void handleLogin(ActionEvent event) throws IOException
    {

        DB.selectSQL("SELECT fldStatus FROM tblEmployee WHERE fldEmployeeID = 1");
        do {
            String data = DB.getData();
            if (data.equals(DB.NOMOREDATA)) {
                break;
            } else {
                // WE ADD EACH ELEMENT TO THE ARRAY LIST
                System.out.print(data);
            }
        } while (true);
        //(passwordTextfield.getText().equals("1234") && usernameTextfield.getText().equals("johnwick")
        if(passwordTextfield.getText().equals(""))
        {

          Stage mainWindow = (Stage)((Node)event.getSource()).getScene().getWindow();
            loadscreen(mainWindow, "MainGUI.fxml");
        }
        else
        {
            info1.setText("Password is incorrect. Please Try Again");
        }
    }
///////////////
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

    }
}