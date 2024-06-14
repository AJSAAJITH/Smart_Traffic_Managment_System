package com.logistic.enums;

import java.util.Arrays;
import java.util.List;

public enum Priority_Level {
    URGENT,NORMAL;

    public static List<Priority_Level> getAllPriorityLevel(){
        return Arrays.asList(Priority_Level.values());
    }
}
