package LOGIN;

import java.util.Scanner;

public class LoginModule {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Login Module");
        System.out.println("enter username:");
        String username = sc.next();
        System.out.println("enter Password:");
        String password = sc.next();
        LoginServices ob1 = new LoginServices();
        boolean valid  = ob1.validate(username,password);
        if(valid){
            System.out.println("Welcome..............Access granted");

        }
        else {
            System.out.println("Access denied invalid credentials");
            System.out.println("exiting........");
        }
        sc.close();
    }

}