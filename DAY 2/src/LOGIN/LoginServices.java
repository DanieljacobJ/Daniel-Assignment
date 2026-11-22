package LOGIN;

import java.util.HashMap;

public class LoginServices {
    HashMap<String , String> LoginDetails = new HashMap<>();

    public LoginServices() {
        LoginDetails.put("dj","Daniel@123");
        LoginDetails.put("jacob","Daniel@123");
        LoginDetails.put("dj7","Daniel@123");
        LoginDetails.put("Daniel","Daniel@143");

    }

    public boolean validate(String username, String password) {
        if(LoginDetails.containsKey(username)){
            String pass = LoginDetails.get(username);
            if(pass.equals(password)){
                return true;
            }
        }
        return false;
    }
}
