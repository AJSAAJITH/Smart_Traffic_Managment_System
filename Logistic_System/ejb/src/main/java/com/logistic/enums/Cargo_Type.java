package com.logistic.enums;

import java.util.Arrays;
import java.util.List;

public enum Cargo_Type {
    PERISHABLE,
    NON_PERISHABLE,
    HAZARDOUS,
    FRAGILE,
    LIQUID,
    DRY_BULK,
    TEMPERATURE_CONTROLLED,
    LIVE_ANIMAL,
    HIGH_VALUE;
    public static List<Cargo_Type> getCargoTypes() {

        return Arrays.asList(Cargo_Type.values());
    }
}
