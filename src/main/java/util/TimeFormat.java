package util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class TimeFormat {
    public static String formatTime(Timestamp myTimestamp) {
        return new SimpleDateFormat("MM/dd/yyyy HH:mm:ss").format(myTimestamp);
    }
}
