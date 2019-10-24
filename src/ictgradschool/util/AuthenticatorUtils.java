package ictgradschool.util;

import ictgradschool.web.deployments.controller.UserJavaBean;

public class AuthenticatorUtils {

    public static UserJavaBean createAccount(String username, String password) {

        // Generate hashed, salted password and return a new User object with the appropriate information
        byte[] salt = Passwords.getNextSalt();
        String saltString = Passwords.base64Encode(salt);

        int iterations =(int)(Math.random()*1000) + 1;

        byte[] passwordHash = Passwords.hash(password.toCharArray(), salt, iterations);
        String passwordHashString = Passwords.base64Encode(passwordHash);

        return new UserJavaBean(0, username,"password", passwordHashString, saltString, iterations);

    }

    public static boolean authenticate(UserJavaBean user, String password) {

        // Return a value indicating whether the given plaintext password matches the information containe in the given User object.
        return Passwords.isExpectedPassword(password.toCharArray(), Passwords.base64Decode(user.getSaltBase64()), user.getNumIterations(), Passwords.base64Decode(user.getPassHashBase64()));
    }

}