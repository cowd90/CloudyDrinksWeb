package util;

import java.text.DecimalFormat;

public class NumberCurrencyFormat {
    public static String numberCurrencyFormat(String number) {
        DecimalFormat decimalFormat = new DecimalFormat("###,###");
        return decimalFormat.format(Integer.parseInt(number)) + "₫";
    }
}
