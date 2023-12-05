package util;

import java.text.DecimalFormat;

public class NumberCurrencyFormat {
    public static String numberCurrencyFormat(int number) {
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        return decimalFormat.format(number);
    }
}
