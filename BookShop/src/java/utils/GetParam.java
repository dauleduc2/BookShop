package utils;

import javax.servlet.http.HttpServletRequest;

public class GetParam {

    //GET STRING
    public static String getStringParam(HttpServletRequest request, String field, String label, int min, int max,
            String defaultValue) {
        String value = (String) request.getParameter(field);

        //check empty string, if empty then return to default value
        if (value == null || value.trim().isEmpty()) {
            if (defaultValue == null) {
                request.setAttribute(field + "Error", label + " is required");
                return null;
            }

            return defaultValue;
        }

        //check min and max of string
        if (value.trim().length() > max) {
            request.setAttribute(field + "Error", label + " is less than or equal " + max + " character(s)");
            return null;
        }
        if (value.trim().length() < min) {
            request.setAttribute(field + "Error", label + " is greater than or equal " + min + " character(s)");
            return null;
        }
        return value.trim();
    }

    //GET INT
    public static Integer getIntParams(HttpServletRequest request, String field, String label, int min, int max,
            Integer defaultValue) {

        String value = (String) request.getParameter(field);
        Integer realValue;

        //check empty string, if empty then return to default value
        if (value == null || value.isEmpty()) {
            if (defaultValue == null) {
                request.setAttribute(field + "Error", label + " is required");
                return null;
            }
            return defaultValue;
        }

        try {
            realValue = Integer.parseInt(value);
        } catch (NumberFormatException e) {
            request.setAttribute(field + "Error",
                    label + " must be a number and less than or equal " + Integer.MAX_VALUE);
            return null;
        }
        if (realValue > max) {
            request.setAttribute(field + "Error", label + " is less than or equal " + max);
            return null;
        }
        if (realValue < min) {
            request.setAttribute(field + "Error", label + " is greater than or equal " + min);
            return null;
        }

        return realValue;
    }

    //GET FLOAT
    public static Float getFloatParams(HttpServletRequest request, String field, String label, float min, float max,
            Float defaultValue) {

        String value = (String) request.getParameter(field);
        Float realValue;

        //check empty string, if empty then return to default value
        if (value == null || value.isEmpty()) {
            if (defaultValue == null) {
                request.setAttribute(field + "Error", label + " is required");
                return null;
            }
            return defaultValue;
        }

        try {
            realValue = Float.parseFloat(value);
        } catch (NumberFormatException e) {
            request.setAttribute(field + "Error",
                    label + " must be a number and less than or equal " + Float.MAX_VALUE);
            return null;
        }
        if (realValue > max) {
            request.setAttribute(field + "Error", label + " is less than or equal " + max);
            return null;
        }
        if (realValue < min) {
            request.setAttribute(field + "Error", label + " is greater than or equal " + min);
            return null;
        }

        return realValue;
    }
}