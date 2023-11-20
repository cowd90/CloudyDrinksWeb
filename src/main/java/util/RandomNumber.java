package util;

import java.util.Random;

public class RandomNumber {
    public static String getRandomNumber() {
        Random random = new Random();
        String n1 = random.nextInt(10)+ "";;
        String n2 = random.nextInt(10)+ "";;
        String n3 = random.nextInt(10)+ "";;
        String n4 = random.nextInt(10)+ "";;
        String n5 = random.nextInt(10)+ "";;
        String n6 = random.nextInt(10)+ "";

        return n1 + n2 + n3 + n4 + n5 + n6;
    }
}
