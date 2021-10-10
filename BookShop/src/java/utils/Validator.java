package utils;

import java.util.regex.Pattern;

public class Validator {

    public static String getEmail(String value) {
        Pattern regex = Pattern.compile("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b");

        boolean ismatched = regex.matcher(value).matches();
        if (!ismatched) {
            return " is not correct format. Please enter a valid email.";
        }
        return "";
    }
}
