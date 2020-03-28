
import com.phong.sem4.m3demoservlet.controller.utils.CommonUtils;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nguoi
 */
public class NewClass {
    public static void main(String[] args) {
        try {
//            String generatePassword = CommonUtils.generatePassword("quantri", CommonUtils.getSalt());
            String generatePassword = CommonUtils.generatePassword("quantri");
            
            System.out.println("        " + generatePassword);
        } catch (Exception ex) {
            Logger.getLogger(NewClass.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
