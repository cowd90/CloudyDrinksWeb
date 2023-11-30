package util;

import java.util.Random;

public class RandomKey {
    public static String generateKey() {
        String upCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowCase = "abcdefghijklmnopqrstuvwxyz";
        String number = "123456789";

        String alphaNumeric = upCase + lowCase + number;
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        int length = 10;
        for (int i = 0; i < length; i++) {
            int index = random.nextInt(alphaNumeric.length());
            char randomchar = alphaNumeric.charAt(index);
            sb.append(randomchar);
        }

        return sb.toString();
    }
}
