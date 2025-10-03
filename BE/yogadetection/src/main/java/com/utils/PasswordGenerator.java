package com.utils;

public class PasswordGenerator {
    public static String generatePassword() {
        String upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lower = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String special = "!@#$%^&*()-_=+[]{}|;:,.<>?";

        String allChars = upper + lower + digits + special;
        StringBuilder password = new StringBuilder();

        password.append(upper.charAt((int) (Math.random() * upper.length())));
        password.append(lower.charAt((int) (Math.random() * lower.length())));
        password.append(digits.charAt((int) (Math.random() * digits.length())));
        password.append(special.charAt((int) (Math.random() * special.length())));

        // Fill the remaining characters randomly
        for (int i = 4; i < 12; i++) { // Password length between 8 and 12
            password.append(allChars.charAt((int) (Math.random() * allChars.length())));
        }

        char[] pwdArray = password.toString().toCharArray();
        for (int i = 0; i < pwdArray.length; i++) {
            int randomIndex = (int) (Math.random() * pwdArray.length);
            char temp = pwdArray[i];
            pwdArray[i] = pwdArray[randomIndex];
            pwdArray[randomIndex] = temp;
        }

        return new String(pwdArray);
    }
}
