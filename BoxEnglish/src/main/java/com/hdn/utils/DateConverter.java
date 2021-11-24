package com.hdn.utils;

import com.hdn.entity.ReviewEntity;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

public class DateConverter {
    public static LocalDateTime convertToLocalDateTimeViaInstant(Date dateToConvert) {
        return dateToConvert.toInstant()
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();
    }
    public static LocalDateTime convertToLocalDateTimeViaSqlTimestamp(Date dateToConvert) {
        return new java.sql.Timestamp(
                dateToConvert.getTime()).toLocalDateTime();
    }
    public static boolean compareDate(LocalDateTime datelatest,LocalDateTime datenow) {
        int dayLatest=0,monthLatest=0,yearLatest=0;
        int dayNow=0,monthNow=0,yearNow=0;

        dayLatest=datelatest.getDayOfMonth();
        monthLatest=datelatest.getMonthValue();
        yearLatest=datelatest.getYear();

        dayNow=datenow.getDayOfMonth();
        monthNow=datenow.getMonthValue();
        yearNow = datenow.getYear();

        int valueNow = 366*yearNow+12*monthNow+dayNow;
        int valueLatest = 366*yearLatest+12*monthLatest+dayLatest;
        if (valueNow > valueLatest) {
            return true;
        } else {
            return false;
        }
    }
}
